## GCC: 64-bit 9.3.0 Ubuntu 20.04

### Naming Convention

The names of functions when calling using `extern "C"` are as is.

### Register Usage

The following registers are considered scratch registers, the callee doesn't
need to preserve their values before and after the function call.

| Register       | Usage                                                                | Must Preserve |
| -------------- | -------------------------------------------------------------------- | ------------- |
| `RAX`          | Varargs vector register count or scratch on input. Result on output. | No            |
| `RBX`          |                                                                      | Yes           |
| `RCX`          | Integer Parameter #4.                                                | No            |
| `RDX`          | Integer Parameter #3. (Optional) result on output.                   | No            |
| `RSP`          | Stack pointer.                                                       | Yes           |
| `RBP`          | Stack Frame Pointer.                                                 | Yes           |
| `RSI`          | Integer Parameter #2.                                                | No            |
| `RDI`          | Integer Parameter #1.                                                | No            |
| `R8`           | Integer Parameter #5.                                                | No            |
| `R8`           | Integer Parameter #6.                                                | No            |
| `R10`          | Functions static chain pointer                                       | No            |
| `R11`          | scratch                                                              | No            |
| `R12`-`R14`    |                                                                      | Yes           |
| `R15`          | (Optional) Global Offset Table Base Pointer                          | Yes           |
| `XMM0`-`XMM1`  | Float Parameter #1, #2. Result on output                             | No            |
| `XMM2`-`XMM7`  | Float Parameter #3-#8.                                               | No            |
| `XMM8`-`XMM15` | scratch                                                              | No            |
| `st0`-`st1`    | scratch. Result on output `long double`.                             | No            |
| `st2`-`st7`    | scratch                                                              | No            |
| x87 sw         | x87 status word                                                      | No            |
| x87 cw         | x87 control world                                                    | Yes           |

### Stack Alignment

The stack frames are expected to be aligned on 16-byte boundaries.

### The Stack Red Zone

The Sys V ABI specifies a *red zone* for 64-bit, which is 128 bytes below the
stack pointer register `RSP` (e.g. from the current address, to `RSP` - 128). As
the function might push and pop from the stack, so changes the red zone.

The Red Zone is important that it may not be modified by interrupt handlers or
signal handlers. This allows functions an optimization that it doesn't
necessarily have to allocate space for the stack if it is less than 128 bytes.

### Parameter Passing

The first 6 integer parameters (`bool`, `char`, `short`, `int`, `long`, `long
long` and pointers) of a function are passed via the registers `RDI`, `RSI`,
`RDX`, `RCX`, `R8` and `R9`.

Arguments `float`, `double` are passed into `XMM0`-`XMM7`.

### Intel CET Instructions

Many functions, when dumped in their assembly form, show the `endbr64`
instruction at the start of each function. This is part of Intel's Control-flow
Enforcement Technology. The `endbr64` and `endbr32` is equivalent to a `nop`
instruction on processors that do not support
[CET](https://www.intel.com/content/www/us/en/developer/articles/technical/technical-look-control-flow-enforcement-technology.html).

This function is emitted in GCC 8 and later.

### Examples

The examples provided are compiled using the GCC compiler. Disassembly of the
functions is done on the object files before linking, thus the `call`
instructions reference function names but the offsets have not yet been patched
by the linker.

#### 32-bit Integer Return Value

```c
int funcintr(void)
{
  return 42;
}

int test_funcintr(void)
{
  int a;
  a = funcintr() + 1;
  return a;
}
```

```asm
000000000000145b <test_funcintr>:
    145b: f3 0f 1e fa           endbr64
    145f: 55                    push   rbp
    1460: 48 89 e5              mov    rbp,rsp
    1463: 48 83 ec 10           sub    rsp,0x10
    1467: e8 dd fc ff ff        call   1149 <funcintr>
    146c: 83 c0 01              add    eax,0x1
    146f: 89 45 fc              mov    DWORD PTR [rbp-0x4],eax
    1472: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    1475: c9                    leave
    1476: c3                    ret

0000000000001149 <funcintr>:
    1149: f3 0f 1e fa           endbr64
    114d: 55                    push   rbp
    114e: 48 89 e5              mov    rbp,rsp
    1151: b8 2a 00 00 00        mov    eax,0x2a
    1156: 5d                    pop    rbp
    1157: c3                    ret
```

Observations:

* The result is placed in the register `EAX`, which is the 32-bit version.
* The caller has allocated 16-bytes stack for itself, which is used to hold the
  variable `a` (`[rbp-0x4]`).
* The second `mov` instruction at line `1472` is generated by the `return a;`
  instruction, that must put the value of `a` into `EAX`.

The callee doesn't have any parameters and doesn't use the stack except to store
the stack frame pointer, so we don't describe the stack frame here.

#### 64-bit Integer Return Value

##### 64-bit return in full 64-bits

```c
uint64_t funcint64r(void)
{
  return 0x4200000000;
}

int test_funcint64r(void)
{
  uint64_t a;
  a = funcint64r() + 1;
  return (int)a;
}
```

```asm
0000000000001477 <test_funcint64r>:
    1477: f3 0f 1e fa           endbr64
    147b: 55                    push   rbp
    147c: 48 89 e5              mov    rbp,rsp
    147f: 48 83 ec 10           sub    rsp,0x10
    1483: e8 d0 fc ff ff        call   1158 <funcint64r>
    1488: 48 83 c0 01           add    rax,0x1
    148c: 48 89 45 f8           mov    QWORD PTR [rbp-0x8],rax
    1490: 48 8b 45 f8           mov    rax,QWORD PTR [rbp-0x8]
    1494: c9                    leave
    1495: c3                    ret

0000000000001158 <funcint64r>:
    1158: f3 0f 1e fa           endbr64
    115c: 55                    push   rbp
    115d: 48 89 e5              mov    rbp,rsp
    1160: 48 b8 00 00 00 00 42  movabs rax,0x4200000000
    1167: 00 00 00
    116a: 5d                    pop    rbp
    116b: c3                    ret
```

##### 64-bit Return Needing only 32-bits

```c
uint64_t funcint64r2(void)
{
  return 42;
}

int test_funcint64r2(void)
{
  uint64_t a;
  a = funcint64r2() + 1;
  return (int)a;
}
```

```asm
0000000000001496 <test_funcint64r2>:
    1496: f3 0f 1e fa           endbr64
    149a: 55                    push   rbp
    149b: 48 89 e5              mov    rbp,rsp
    149e: 48 83 ec 10           sub    rsp,0x10
    14a2: e8 c5 fc ff ff        call   116c <funcint64r2>
    14a7: 48 83 c0 01           add    rax,0x1
    14ab: 48 89 45 f8           mov    QWORD PTR [rbp-0x8],rax
    14af: 48 8b 45 f8           mov    rax,QWORD PTR [rbp-0x8]
    14b3: c9                    leave
    14b4: c3                    ret

000000000000116c <funcint64r2>:
    116c: f3 0f 1e fa           endbr64
    1170: 55                    push   rbp
    1171: 48 89 e5              mov    rbp,rsp
    1174: b8 2a 00 00 00        mov    eax,0x2a
    1179: 5d                    pop    rbp
    117a: c3                    ret
```

Observations:

* The function `mov eax,0x2a` automatically zeroes the upper 32-bits, and
  although it's written as a 32-bit instruction, it performs the desired result
  of copying the value 42 into the 64-bit register correctly. Thus this is the
  same as moving the value 42 into `RAX` but requires fewer bytes to do so.
* Even though the result should return a 32-bit value, we see that the compiler
  still returns the 64-bit register `RAX`. As such, this function looks
  identical to one that returns a 64-bit value.

#### Integer Parameters

```c
int funcint(int a, int b, int c)
{
  return (a + 1) * (b + 2) * (c + 3);
}

int test_funcint(void)
{
  int a;
  a = funcint(1, 2, 3) + 1;
  return a;
}
```

```asm
00000000000014b5 <test_funcint>:
    14b5: f3 0f 1e fa           endbr64
    14b9: 55                    push   rbp
    14ba: 48 89 e5              mov    rbp,rsp
    14bd: 48 83 ec 10           sub    rsp,0x10
    14c1: ba 03 00 00 00        mov    edx,0x3
    14c6: be 02 00 00 00        mov    esi,0x2
    14cb: bf 01 00 00 00        mov    edi,0x1
    14d0: e8 a6 fc ff ff        call   117b <funcint>
    14d5: 83 c0 01              add    eax,0x1
    14d8: 89 45 fc              mov    DWORD PTR [rbp-0x4],eax
    14db: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    14de: c9                    leave
    14df: c3                    ret

000000000000117b <funcint>:
    117b: f3 0f 1e fa           endbr64
    117f: 55                    push   rbp
    1180: 48 89 e5              mov    rbp,rsp
    1183: 89 7d fc              mov    DWORD PTR [rbp-0x4],edi
    1186: 89 75 f8              mov    DWORD PTR [rbp-0x8],esi
    1189: 89 55 f4              mov    DWORD PTR [rbp-0xc],edx
    118c: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    118f: 8d 50 01              lea    edx,[rax+0x1]
    1192: 8b 45 f8              mov    eax,DWORD PTR [rbp-0x8]
    1195: 83 c0 02              add    eax,0x2
    1198: 0f af c2              imul   eax,edx
    119b: 8b 55 f4              mov    edx,DWORD PTR [rbp-0xc]
    119e: 83 c2 03              add    edx,0x3
    11a1: 0f af c2              imul   eax,edx
    11a4: 5d                    pop    rbp
    11a5: c3                    ret
```

Observations

* The caller puts the parameters into registers `RDI`, `RSI`, `RDX`. It is up to
  the callee to copy it onto its own stack. If there were six parameters, it
  would continue in `RCX`, `R8` and `R9`.
* The callee pushes the value onto the stack (or more correctly, it copies it
  into the memory onto the stack but doesn't update the stack pointer). This is
  put in the red zone of the function stack.
* The first parameter has the highest address (see stack frame below)

The stack frame of `funcint`, referenced by `RBP`, looks like

| Offset               | Value                                            |
| -------------------- | ------------------------------------------------ |
| `qword ptr [RBP+8]`  | Callers `RIP` return address                     |
| `qword ptr [RBP]`    | Callers `RBP` preserved by the callee `funcint`  |
| `dword ptr [RBP-4]`  | `funcint` Parameter 1, `int a` copied from `EDI` |
| `dword ptr [RBP-8]`  | `funcint` Parameter 2, `int b` copied from `ESI` |
| `dword ptr [RBP-12]` | `funcint` Parameter 3, `int c` copied from `EDX` |

#### Char Parameters

```c
int funcchar(char a, char b)
{
  return (a + 1) * (b + 2);
}

int test_funcchar(void)
{
  int a;
  a = funcchar(1, 2) + 1;
  return a;
}
```

```asm
00000000000014e0 <test_funcchar>:
    14e0: f3 0f 1e fa           endbr64
    14e4: 55                    push   rbp
    14e5: 48 89 e5              mov    rbp,rsp
    14e8: 48 83 ec 10           sub    rsp,0x10
    14ec: be 02 00 00 00        mov    esi,0x2
    14f1: bf 01 00 00 00        mov    edi,0x1
    14f6: e8 ab fc ff ff        call   11a6 <funcchar>
    14fb: 83 c0 01              add    eax,0x1
    14fe: 89 45 fc              mov    DWORD PTR [rbp-0x4],eax
    1501: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    1504: c9                    leave
    1505: c3                    ret

00000000000011a6 <funcchar>:
    11a6: f3 0f 1e fa           endbr64
    11aa: 55                    push   rbp
    11ab: 48 89 e5              mov    rbp,rsp
    11ae: 89 fa                 mov    edx,edi
    11b0: 89 f0                 mov    eax,esi
    11b2: 88 55 fc              mov    BYTE PTR [rbp-0x4],dl
    11b5: 88 45 f8              mov    BYTE PTR [rbp-0x8],al
    11b8: 0f be 45 fc           movsx  eax,BYTE PTR [rbp-0x4]
    11bc: 8d 50 01              lea    edx,[rax+0x1]
    11bf: 0f be 45 f8           movsx  eax,BYTE PTR [rbp-0x8]
    11c3: 83 c0 02              add    eax,0x2
    11c6: 0f af c2              imul   eax,edx
    11c9: 5d                    pop    rbp
    11ca: c3                    ret
```

Observations

* The first parameters are copied into `RDI` and `ESI`.
* The functions local stack is used to store the parameters, but aren't part of
  the Sys V ABI. This is put in the red zone of the function stack.

The stack frame of `funcchar`, referenced by `RBP`, looks like

| Offset              | Value                                              |
| ------------------- | -------------------------------------------------- |
| `qword ptr [RBP+8]` | Callers `RIP` return address                       |
| `qword ptr [RBP]`   | Callers `RBP` preserved by the callee `funcchar`   |
| `dword ptr [RBP-4]` | `funcchar` Parameter 1, `char a` copied from `EDI` |
| `dword ptr [RBP-8]` | `funcchar` Parameter 2, `char b` copied from `ESI` |

#### Float Parameters

```c
float funcfloat(float a, float b, float c)
{
  return (a + 1.0) * (b + 2.0) * (c + 3.0);
}

int test_funcfloat(void)
{
  float a;
  a = funcfloat(1.0, 2.0, 3.0) + 4.0;
  return (int)a;
}
```

```asm
0000000000001506 <test_funcfloat>:
    1506: f3 0f 1e fa           endbr64
    150a: 55                    push   rbp
    150b: 48 89 e5              mov    rbp,rsp
    150e: 48 83 ec 10           sub    rsp,0x10
    1512: f3 0f 10 15 0e 0b 00  movss  xmm2,DWORD PTR [rip+0xb0e]        # 2028 <_IO_stdin_used+0x28>
    1519: 00
    151a: f3 0f 10 0d 0a 0b 00  movss  xmm1,DWORD PTR [rip+0xb0a]        # 202c <_IO_stdin_used+0x2c>
    1521: 00
    1522: f3 0f 10 05 06 0b 00  movss  xmm0,DWORD PTR [rip+0xb06]        # 2030 <_IO_stdin_used+0x30>
    1529: 00
    152a: e8 9c fc ff ff        call   11cb <funcfloat>
    152f: f3 0f 10 0d fd 0a 00  movss  xmm1,DWORD PTR [rip+0xafd]        # 2034 <_IO_stdin_used+0x34>
    1536: 00
    1537: f3 0f 58 c1           addss  xmm0,xmm1
    153b: f3 0f 11 45 fc        movss  DWORD PTR [rbp-0x4],xmm0
    1540: f3 0f 10 45 fc        movss  xmm0,DWORD PTR [rbp-0x4]
    1545: f3 0f 2c c0           cvttss2si eax,xmm0
    1549: c9                    leave
    154a: c3                    ret

00000000000011cb <funcfloat>:
    11cb: f3 0f 1e fa           endbr64
    11cf: 55                    push   rbp
    11d0: 48 89 e5              mov    rbp,rsp
    11d3: f3 0f 11 45 fc        movss  DWORD PTR [rbp-0x4],xmm0
    11d8: f3 0f 11 4d f8        movss  DWORD PTR [rbp-0x8],xmm1
    11dd: f3 0f 11 55 f4        movss  DWORD PTR [rbp-0xc],xmm2
    11e2: f3 0f 5a 4d fc        cvtss2sd xmm1,DWORD PTR [rbp-0x4]
    11e7: f2 0f 10 05 19 0e 00  movsd  xmm0,QWORD PTR [rip+0xe19]        # 2008 <_IO_stdin_used+0x8>
    11ee: 00
    11ef: f2 0f 58 c8           addsd  xmm1,xmm0
    11f3: f3 0f 5a 55 f8        cvtss2sd xmm2,DWORD PTR [rbp-0x8]
    11f8: f2 0f 10 05 10 0e 00  movsd  xmm0,QWORD PTR [rip+0xe10]        # 2010 <_IO_stdin_used+0x10>
    11ff: 00
    1200: f2 0f 58 c2           addsd  xmm0,xmm2
    1204: f2 0f 59 c8           mulsd  xmm1,xmm0
    1208: f3 0f 5a 55 f4        cvtss2sd xmm2,DWORD PTR [rbp-0xc]
    120d: f2 0f 10 05 03 0e 00  movsd  xmm0,QWORD PTR [rip+0xe03]        # 2018 <_IO_stdin_used+0x18>
    1214: 00
    1215: f2 0f 58 c2           addsd  xmm0,xmm2
    1219: f2 0f 59 c1           mulsd  xmm0,xmm1
    121d: f2 0f 5a c0           cvtsd2ss xmm0,xmm0
    1221: 5d                    pop    rbp
    1222: c3                    ret
```

Observations

* The parameters are passed into `XMM0`-`XMM2`.
* The result is returned to the caller in `XMM0`.
* The functions local stack is used to store the parameters, but aren't part of
  the Sys V ABI. This is put in the red zone of the function stack.
* The constants are stored in memory as a QWORD and copied into register, and
  the parameters are promoted to a double in this code.

The stack frame of `funcfloat`, referenced by `RBP`, looks like

| Offset               | Value                                                 |
| -------------------- | ----------------------------------------------------- |
| `qword ptr [RBP+8]`  | Callers `RIP` return address                          |
| `qword ptr [RBP]`    | Callers `RBP` preserved by the callee `funcfloat`     |
| `dword ptr [RBP-4]`  | `funcfloat` Parameter 1, `float a` copied from `XMM0` |
| `dword ptr [RBP-8]`  | `funcfloat` Parameter 2, `float b` copied from `XMM1` |
| `dword ptr [RPB-12]` | `funcfloat` Parameter 3, `float c` copied from `XMM2` |

#### Mixed Float and Integer Parameters

```c
int funcfloatint(int a, float b, int c, float d)
{
  return (a + 1) * (b + 2.0) * (c + 3) * (d + 4.0);
}

int test_funcfloatint(void)
{
  int a;
  a = funcfloatint(1, 2.0, 3, 4.0) + 1;
  return a;
}
```

```asm
000000000000154b <test_funcfloatint>:
    154b: f3 0f 1e fa           endbr64
    154f: 55                    push   rbp
    1550: 48 89 e5              mov    rbp,rsp
    1553: 48 83 ec 10           sub    rsp,0x10
    1557: f3 0f 10 0d d5 0a 00  movss  xmm1,DWORD PTR [rip+0xad5]        # 2034 <_IO_stdin_used+0x34>
    155e: 00
    155f: be 03 00 00 00        mov    esi,0x3
    1564: f3 0f 10 05 c0 0a 00  movss  xmm0,DWORD PTR [rip+0xac0]        # 202c <_IO_stdin_used+0x2c>
    156b: 00
    156c: bf 01 00 00 00        mov    edi,0x1
    1571: e8 ad fc ff ff        call   1223 <funcfloatint>
    1576: 83 c0 01              add    eax,0x1
    1579: 89 45 fc              mov    DWORD PTR [rbp-0x4],eax
    157c: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    157f: c9                    leave
    1580: c3                    ret

0000000000001223 <funcfloatint>:
    1223: f3 0f 1e fa           endbr64
    1227: 55                    push   rbp
    1228: 48 89 e5              mov    rbp,rsp
    122b: 89 7d fc              mov    DWORD PTR [rbp-0x4],edi
    122e: f3 0f 11 45 f8        movss  DWORD PTR [rbp-0x8],xmm0
    1233: 89 75 f4              mov    DWORD PTR [rbp-0xc],esi
    1236: f3 0f 11 4d f0        movss  DWORD PTR [rbp-0x10],xmm1
    123b: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    123e: 83 c0 01              add    eax,0x1
    1241: f2 0f 2a c8           cvtsi2sd xmm1,eax
    1245: f3 0f 5a 55 f8        cvtss2sd xmm2,DWORD PTR [rbp-0x8]
    124a: f2 0f 10 05 be 0d 00  movsd  xmm0,QWORD PTR [rip+0xdbe]        # 2010 <_IO_stdin_used+0x10>
    1251: 00
    1252: f2 0f 58 c2           addsd  xmm0,xmm2
    1256: f2 0f 59 c8           mulsd  xmm1,xmm0
    125a: 8b 45 f4              mov    eax,DWORD PTR [rbp-0xc]
    125d: 83 c0 03              add    eax,0x3
    1260: f2 0f 2a c0           cvtsi2sd xmm0,eax
    1264: f2 0f 59 c8           mulsd  xmm1,xmm0
    1268: f3 0f 5a 55 f0        cvtss2sd xmm2,DWORD PTR [rbp-0x10]
    126d: f2 0f 10 05 ab 0d 00  movsd  xmm0,QWORD PTR [rip+0xdab]        # 2020 <_IO_stdin_used+0x20>
    1274: 00
    1275: f2 0f 58 c2           addsd  xmm0,xmm2
    1279: f2 0f 59 c1           mulsd  xmm0,xmm1
    127d: f2 0f 2c c0           cvttsd2si eax,xmm0
    1281: 5d                    pop    rbp
    1282: c3                    ret
```

Observations

* The parameters are passed into `XMM0`-`XMM1`, `ESI`, `EDI`.
* The result is returned to the caller in `EAX`.
* The functions local stack is used to store the parameters, but aren't part of
  the Sys V ABI. This is put in the red zone of the function stack.
* The constants are stored in memory as a QWORD and copied into register, and
  the parameters are promoted to a double in this code.

The stack frame of `funcfloatint`, referenced by `RBP`, looks like

| Offset               | Value                                                    |
| -------------------- | -------------------------------------------------------- |
| `qword ptr [RBP+8]`  | Callers `RIP` return address                             |
| `qword ptr [RBP]`    | Callers `RBP` preserved by the callee `funcfloatint`     |
| `dword ptr [RBP-4]`  | `funcfloatint` Parameter 1, `int a` copied from `EDI`    |
| `dword ptr [RBP-8]`  | `funcfloatint` Parameter 2, `float b` copied from `XMM0` |
| `dword ptr [RPB-12]` | `funcfloatint` Parameter 3, `int c` copied from `ESI`    |
| `dword ptr [RBP-16]` | `funcfloatint` Parameter 4, `float c` copied from `XMM1` |

#### Double Parameters

```c
double funcdouble(double a, double b)
{
  return (a + 2) * (b + 4);
}

int test_funcdouble(void)
{
  double a;
  a = funcdouble(2.0, 4.0) + 1.0;
  return (int)a;
}
```

```asm
0000000000001581 <test_funcdouble>:
    1581: f3 0f 1e fa           endbr64
    1585: 55                    push   rbp
    1586: 48 89 e5              mov    rbp,rsp
    1589: 48 83 ec 10           sub    rsp,0x10
    158d: f2 0f 10 05 a3 0a 00  movsd  xmm0,QWORD PTR [rip+0xaa3]        # 2038 <_IO_stdin_used+0x38>
    1594: 00
    1595: 48 8b 05 a4 0a 00 00  mov    rax,QWORD PTR [rip+0xaa4]        # 2040 <_IO_stdin_used+0x40>
    159c: 66 0f 28 c8           movapd xmm1,xmm0
    15a0: 66 48 0f 6e c0        movq   xmm0,rax
    15a5: e8 d9 fc ff ff        call   1283 <funcdouble>
    15aa: f2 0f 10 0d 96 0a 00  movsd  xmm1,QWORD PTR [rip+0xa96]        # 2048 <_IO_stdin_used+0x48>
    15b1: 00
    15b2: f2 0f 58 c1           addsd  xmm0,xmm1
    15b6: f2 0f 11 45 f8        movsd  QWORD PTR [rbp-0x8],xmm0
    15bb: f2 0f 10 45 f8        movsd  xmm0,QWORD PTR [rbp-0x8]
    15c0: f2 0f 2c c0           cvttsd2si eax,xmm0
    15c4: c9                    leave
    15c5: c3                    ret

0000000000001283 <funcdouble>:
    1283: f3 0f 1e fa           endbr64
    1287: 55                    push   rbp
    1288: 48 89 e5              mov    rbp,rsp
    128b: f2 0f 11 45 f8        movsd  QWORD PTR [rbp-0x8],xmm0
    1290: f2 0f 11 4d f0        movsd  QWORD PTR [rbp-0x10],xmm1
    1295: f2 0f 10 4d f8        movsd  xmm1,QWORD PTR [rbp-0x8]
    129a: f2 0f 10 05 6e 0d 00  movsd  xmm0,QWORD PTR [rip+0xd6e]        # 2010 <_IO_stdin_used+0x10>
    12a1: 00
    12a2: f2 0f 58 c8           addsd  xmm1,xmm0
    12a6: f2 0f 10 55 f0        movsd  xmm2,QWORD PTR [rbp-0x10]
    12ab: f2 0f 10 05 6d 0d 00  movsd  xmm0,QWORD PTR [rip+0xd6d]        # 2020 <_IO_stdin_used+0x20>
    12b2: 00
    12b3: f2 0f 58 c2           addsd  xmm0,xmm2
    12b7: f2 0f 59 c1           mulsd  xmm0,xmm1
    12bb: 5d                    pop    rbp
    12bc: c3                    ret
```

Observations

* The parameters are passed into `XMM0`-`XMM1`.
* The result is returned to the caller in `EAX`.
* The functions local stack is used to store the parameters, but aren't part of
  the Sys V ABI. This is put in the red zone of the function stack.

The stack frame of `funcdouble`, referenced by `RBP`, looks like

| Offset               | Value                                                   |
| -------------------- | ------------------------------------------------------- |
| `qword ptr [RBP+8]`  | Callers `RIP` return address                            |
| `qword ptr [RBP]`    | Callers `RBP` preserved by the callee `funcdouble`      |
| `qword ptr [RBP-8]`  | `funcdouble` Parameter 1, `double a` copied from `XMM0` |
| `qword ptr [RBP-16]` | `funcdouble` Parameter 2, `double b` copied from `XMM1` |

#### Passing a Struct by Value

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

int funcstructvalue(struct mystruct x, struct mystruct *y)
{
  return x.a + y->b;
}

int test_funcstructvalue(void)
{
  struct mystruct x = {1, 2, 3, 4, 5, 6};
  struct mystruct y = {0, };

  int a;
  a = funcstructvalue(x, &y) + 1;
  return a;
}
```

```asm
00000000000015c6 <test_funcstructvalue>:
    15c6: f3 0f 1e fa           endbr64
    15ca: 55                    push   rbp
    15cb: 48 89 e5              mov    rbp,rsp
    15ce: 48 83 ec 50           sub    rsp,0x50
    15d2: 64 48 8b 04 25 28 00  mov    rax,QWORD PTR fs:0x28
    15d9: 00 00
    15db: 48 89 45 f8           mov    QWORD PTR [rbp-0x8],rax
    15df: 31 c0                 xor    eax,eax
    15e1: c7 45 c0 01 00 00 00  mov    DWORD PTR [rbp-0x40],0x1
    15e8: c7 45 c4 02 00 00 00  mov    DWORD PTR [rbp-0x3c],0x2
    15ef: c7 45 c8 03 00 00 00  mov    DWORD PTR [rbp-0x38],0x3
    15f6: c7 45 cc 04 00 00 00  mov    DWORD PTR [rbp-0x34],0x4
    15fd: c7 45 d0 05 00 00 00  mov    DWORD PTR [rbp-0x30],0x5
    1604: c7 45 d4 06 00 00 00  mov    DWORD PTR [rbp-0x2c],0x6
    160b: 48 c7 45 e0 00 00 00  mov    QWORD PTR [rbp-0x20],0x0
    1612: 00
    1613: 48 c7 45 e8 00 00 00  mov    QWORD PTR [rbp-0x18],0x0
    161a: 00
    161b: 48 c7 45 f0 00 00 00  mov    QWORD PTR [rbp-0x10],0x0
    1622: 00
    1623: 48 8d 45 e0           lea    rax,[rbp-0x20]
    1627: 48 83 ec 08           sub    rsp,0x8
    162b: ff 75 d0              push   QWORD PTR [rbp-0x30]
    162e: ff 75 c8              push   QWORD PTR [rbp-0x38]
    1631: ff 75 c0              push   QWORD PTR [rbp-0x40]
    1634: 48 89 c7              mov    rdi,rax
    1637: e8 81 fc ff ff        call   12bd <funcstructvalue>
    163c: 48 83 c4 20           add    rsp,0x20
    1640: 83 c0 01              add    eax,0x1
    1643: 89 45 bc              mov    DWORD PTR [rbp-0x44],eax
    1646: 8b 45 bc              mov    eax,DWORD PTR [rbp-0x44]
    1649: 48 8b 55 f8           mov    rdx,QWORD PTR [rbp-0x8]
    164d: 64 48 33 14 25 28 00  xor    rdx,QWORD PTR fs:0x28
    1654: 00 00
    1656: 74 05                 je     165d <test_funcstructvalue+0x97>
    1658: e8 f3 f9 ff ff        call   1050 <__stack_chk_fail@plt>
    165d: c9                    leave
    165e: c3                    ret

00000000000012bd <funcstructvalue>:
    12bd: f3 0f 1e fa           endbr64
    12c1: 55                    push   rbp
    12c2: 48 89 e5              mov    rbp,rsp
    12c5: 48 89 7d f8           mov    QWORD PTR [rbp-0x8],rdi
    12c9: 8b 55 10              mov    edx,DWORD PTR [rbp+0x10]
    12cc: 48 8b 45 f8           mov    rax,QWORD PTR [rbp-0x8]
    12d0: 8b 40 04              mov    eax,DWORD PTR [rax+0x4]
    12d3: 01 d0                 add    eax,edx
    12d5: 5d                    pop    rbp
    12d6: c3                    ret
```

Observations

* The stack frame uses memory arguments to pass the struct x by value.
* The caller moves the memory to the stack, and then adjusts the stack pointer,
  instead of an explicit push, but it has the same effect in memory.

The stack frame of `funcstructvalue`, referenced by `RBP`, looks like

| Offset                | Value                                                   |
| --------------------- | ------------------------------------------------------- |
| `qword ptr [RBP+128]` | RBP                                                     |
| `qword ptr [RBP+120]` | FS:0x28 stack guard                                     |
| `qword ptr [RBP+112]` | y.e = y.f = 0                                           |
| `qword ptr [RBP+104]` | y.c = y.d = 0                                           |
| `qword ptr [RBP+96]`  | y.a = y.b = 0                                           |
| `qword ptr [RBP+88]`  |                                                         |
| `dword ptr [RBP+84]`  | x.f = 6                                                 |
| `dword ptr [RBP+80]`  | x.e = 5                                                 |
| `dword ptr [RBP+76]`  | x.d = 4                                                 |
| `dword ptr [RBP+72]`  | x.c = 3                                                 |
| `dword ptr [RBP+68]`  | x.b = 2                                                 |
| `dword ptr [RBP+64]`  | x.a = 1                                                 |
| `dword ptr [RBP+60]`  | int a                                                   |
| `dword ptr [RBP+56]`  |                                                         |
| `qword ptr [RBP+48]`  |                                                         |
| `qword ptr [RBP+40]`  |                                                         |
| `dword ptr [RBP+36]`  | x.f = 6                                                 |
| `dword ptr [RBP+32]`  | x.e = 5                                                 |
| `dword ptr [RBP+28]`  | x.d = 4                                                 |
| `dword ptr [RBP+24]`  | x.c = 3                                                 |
| `dword ptr [RBP+20]`  | x.b = 2                                                 |
| `dword ptr [RBP+16]`  | Parameter 1, x.a = 1                                    |
| `qword ptr [RBP+8]`   | Callers `RIP` return address                            |
| `qword ptr [RBP]`     | Callers `RBP` preserved by the callee `funcstructvalue` |
| `qword ptr [RBP-8]`   | Pointer `*y`                                            |

Observations

* The pointer to `struct y` is put in `RAX` on line `1623`, which is then put
  into `RDI` for the first parameter on line `1634`.
* The `struct x` is copied from the stack of `test_funcstructvalue` to the stack
  for `funcstructvalue` from `RBP` + 16 to `RBP` + 40.
* We see that the `y->b` is accessed `RBP` + 100.
* The caller at address `163c` clears the parameter stack of 32 bytes.

It's interesting to see the usage of the `FS` selector register. From [Stack
Overflow](https://stackoverflow.com/questions/10325713/why-does-this-memory-address-fs0x28-fs0x28-have-a-random-value),
this is described as

> Specifically what's taking place, is that `FS:0x28` on Linux is storing a
> special sentinel stack-guard value, and the code is performing a stack-guard
> check. For instance, if you look further in your code, you'll see that the
> value at `FS:0x28` is stored on the stack, and then the contents of the stack
> are recalled and an XOR is performed with the original value at `FS:0x28`. If
> the two values are equal, which means that the zero-bit has been set because
> `XOR`'ing two of the same values results in a zero-value, then we jump to the
> test routine, otherwise we jump to a special function that indicates that the
> stack was somehow corrupted, and the sentinel value stored on the stack was
> changed.

This can be disabled with `-fno-stack-protector`.

#### Returning a Struct by Value

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

struct mystruct funcstructret(int a, int b)
{
  struct mystruct r = {0, };
  r.a = a;
  r.b = b;
  return r;
}

int test_funcstructret(void)
{
  struct mystruct x;
  x = funcstructret(1, 2);
  return x.a;
}
```

```asm
000000000000165f <test_funcstructret>:
    165f: f3 0f 1e fa           endbr64
    1663: 55                    push   rbp
    1664: 48 89 e5              mov    rbp,rsp
    1667: 48 83 ec 20           sub    rsp,0x20
    166b: 64 48 8b 04 25 28 00  mov    rax,QWORD PTR fs:0x28
    1672: 00 00
    1674: 48 89 45 f8           mov    QWORD PTR [rbp-0x8],rax
    1678: 31 c0                 xor    eax,eax
    167a: 48 8d 45 e0           lea    rax,[rbp-0x20]
    167e: ba 02 00 00 00        mov    edx,0x2
    1683: be 01 00 00 00        mov    esi,0x1
    1688: 48 89 c7              mov    rdi,rax
    168b: e8 47 fc ff ff        call   12d7 <funcstructret>
    1690: 8b 45 e0              mov    eax,DWORD PTR [rbp-0x20]
    1693: 48 8b 4d f8           mov    rcx,QWORD PTR [rbp-0x8]
    1697: 64 48 33 0c 25 28 00  xor    rcx,QWORD PTR fs:0x28
    169e: 00 00
    16a0: 74 05                 je     16a7 <test_funcstructret+0x48>
    16a2: e8 a9 f9 ff ff        call   1050 <__stack_chk_fail@plt>
    16a7: c9                    leave
    16a8: c3                    ret

00000000000012d7 <funcstructret>:
    12d7: f3 0f 1e fa           endbr64
    12db: 55                    push   rbp
    12dc: 48 89 e5              mov    rbp,rsp
    12df: 48 89 7d d8           mov    QWORD PTR [rbp-0x28],rdi
    12e3: 89 75 d4              mov    DWORD PTR [rbp-0x2c],esi
    12e6: 89 55 d0              mov    DWORD PTR [rbp-0x30],edx
    12e9: 48 c7 45 e0 00 00 00  mov    QWORD PTR [rbp-0x20],0x0
    12f0: 00
    12f1: 48 c7 45 e8 00 00 00  mov    QWORD PTR [rbp-0x18],0x0
    12f8: 00
    12f9: 48 c7 45 f0 00 00 00  mov    QWORD PTR [rbp-0x10],0x0
    1300: 00
    1301: 8b 45 d4              mov    eax,DWORD PTR [rbp-0x2c]
    1304: 89 45 e0              mov    DWORD PTR [rbp-0x20],eax
    1307: 8b 45 d0              mov    eax,DWORD PTR [rbp-0x30]
    130a: 89 45 e4              mov    DWORD PTR [rbp-0x1c],eax
    130d: 48 8b 4d d8           mov    rcx,QWORD PTR [rbp-0x28]
    1311: 48 8b 45 e0           mov    rax,QWORD PTR [rbp-0x20]
    1315: 48 8b 55 e8           mov    rdx,QWORD PTR [rbp-0x18]
    1319: 48 89 01              mov    QWORD PTR [rcx],rax
    131c: 48 89 51 08           mov    QWORD PTR [rcx+0x8],rdx
    1320: 48 8b 45 f0           mov    rax,QWORD PTR [rbp-0x10]
    1324: 48 89 41 10           mov    QWORD PTR [rcx+0x10],rax
    1328: 48 8b 45 d8           mov    rax,QWORD PTR [rbp-0x28]
    132c: 5d                    pop    rbp
    132d: c3                    ret
```

Observations

* The first parameter is the pointer to the return struct, so that
  `funcstructret` copies the structure into the address pointed to by `RDI`.
  This is memory allocated on the stack of the function `funcstructret`.
* The first and second parameter are passed as though they are the second and
  third parameters of the function call in `ESI` and `EDX`.
* The local copy `mystruct r` is updated, and then at the end of the function,
  it is copied into the first parameter, which is the pointer.
* This shows that it is certainly more efficient to pass the pointer `mystruct
  x` to `funcstructret` and let it write directly into the result, than the
  indirect way of writing to the local stack, and then writing to the stack of
  the caller.

The stack frame of `funcstructret`, referenced by `RBP`, looks like

| Offset               | Value                                               |
| -------------------- | --------------------------------------------------- |
| `qword ptr [RBP+48]` | `RBP`                                               |
| `qword ptr [RBP+40]` | FS:0x28 stack guard                                 |
| `qword ptr [RBP+32]` | `struct mystruct x`                                 |
| `qword ptr [RBP+24]` | `struct mystruct x`                                 |
| `qword ptr [RBP+16]` | `struct mystruct x`                                 |
| `qword ptr [RBP+8]`  | Callers `RIP` return address                        |
| `qword ptr [RBP]`    | Callers `RBP` preserved by the callee `funcvarargs` |
| `qword ptr [RBP-8]`  |                                                     |
| `qword ptr [RBP-16]` | `struct mystruct r`, 0x00                           |
| `qword ptr [RBP-24]` | `struct mystruct r`, 0x00                           |
| `qword ptr [RBP-32]` | `struct mystruct r`, 0x00                           |
| `qword ptr [RBP-40]` | pointer to return value in caller's stack `RBP+16`  |
| `dword ptr [RBP-44]` | `int a`, Parameter 1.                               |
| `dword ptr [RBP-48]` | `int b`, Parameter 2.                               |

#### VarArgs

```c
int funcvarargs(int cnt, ...)
{
  va_list argptr;
  va_start(argptr, cnt);
  int i, j = 0;

  for (i = 0; i < cnt; i++) j += va_arg(argptr, int);
  return j;
}
```

```asm
00000000000016a9 <test_funcvarargs1>:
    16a9: f3 0f 1e fa           endbr64
    16ad: 55                    push   rbp
    16ae: 48 89 e5              mov    rbp,rsp
    16b1: 48 83 ec 10           sub    rsp,0x10
    16b5: bf 01 00 00 00        mov    edi,0x1
    16ba: b8 00 00 00 00        mov    eax,0x0
    16bf: e8 6a fc ff ff        call   132e <funcvarargs>
    16c4: 83 c0 01              add    eax,0x1
    16c7: 89 45 fc              mov    DWORD PTR [rbp-0x4],eax
    16ca: 8b 45 fc              mov    eax,DWORD PTR [rbp-0x4]
    16cd: c9                    leave
    16ce: c3                    ret

000000000000132e <funcvarargs>:
    132e: f3 0f 1e fa           endbr64
    1332: 55                    push   rbp
    1333: 48 89 e5              mov    rbp,rsp
    1336: 48 81 ec f0 00 00 00  sub    rsp,0xf0
    133d: 89 bd 1c ff ff ff     mov    DWORD PTR [rbp-0xe4],edi
    1343: 48 89 b5 58 ff ff ff  mov    QWORD PTR [rbp-0xa8],rsi
    134a: 48 89 95 60 ff ff ff  mov    QWORD PTR [rbp-0xa0],rdx
    1351: 48 89 8d 68 ff ff ff  mov    QWORD PTR [rbp-0x98],rcx
    1358: 4c 89 85 70 ff ff ff  mov    QWORD PTR [rbp-0x90],r8
    135f: 4c 89 8d 78 ff ff ff  mov    QWORD PTR [rbp-0x88],r9
    1366: 84 c0                 test   al,al
    1368: 74 20                 je     138a <funcvarargs+0x5c>
    136a: 0f 29 45 80           movaps XMMWORD PTR [rbp-0x80],xmm0
    136e: 0f 29 4d 90           movaps XMMWORD PTR [rbp-0x70],xmm1
    1372: 0f 29 55 a0           movaps XMMWORD PTR [rbp-0x60],xmm2
    1376: 0f 29 5d b0           movaps XMMWORD PTR [rbp-0x50],xmm3
    137a: 0f 29 65 c0           movaps XMMWORD PTR [rbp-0x40],xmm4
    137e: 0f 29 6d d0           movaps XMMWORD PTR [rbp-0x30],xmm5
    1382: 0f 29 75 e0           movaps XMMWORD PTR [rbp-0x20],xmm6
    1386: 0f 29 7d f0           movaps XMMWORD PTR [rbp-0x10],xmm7
    138a: 64 48 8b 04 25 28 00  mov    rax,QWORD PTR fs:0x28
    1391: 00 00
    1393: 48 89 85 48 ff ff ff  mov    QWORD PTR [rbp-0xb8],rax
    139a: 31 c0                 xor    eax,eax
    139c: c7 85 30 ff ff ff 08  mov    DWORD PTR [rbp-0xd0],0x8
    13a3: 00 00 00
    13a6: c7 85 34 ff ff ff 30  mov    DWORD PTR [rbp-0xcc],0x30
    13ad: 00 00 00
    13b0: 48 8d 45 10           lea    rax,[rbp+0x10]
    13b4: 48 89 85 38 ff ff ff  mov    QWORD PTR [rbp-0xc8],rax
    13bb: 48 8d 85 50 ff ff ff  lea    rax,[rbp-0xb0]
    13c2: 48 89 85 40 ff ff ff  mov    QWORD PTR [rbp-0xc0],rax
    13c9: c7 85 2c ff ff ff 00  mov    DWORD PTR [rbp-0xd4],0x0
    13d0: 00 00 00
    13d3: c7 85 28 ff ff ff 00  mov    DWORD PTR [rbp-0xd8],0x0
    13da: 00 00 00
    13dd: eb 4f                 jmp    142e <funcvarargs+0x100>
    13df: 8b 85 30 ff ff ff     mov    eax,DWORD PTR [rbp-0xd0]
    13e5: 83 f8 2f              cmp    eax,0x2f
    13e8: 77 23                 ja     140d <funcvarargs+0xdf>
    13ea: 48 8b 85 40 ff ff ff  mov    rax,QWORD PTR [rbp-0xc0]
    13f1: 8b 95 30 ff ff ff     mov    edx,DWORD PTR [rbp-0xd0]
    13f7: 89 d2                 mov    edx,edx
    13f9: 48 01 d0              add    rax,rdx
    13fc: 8b 95 30 ff ff ff     mov    edx,DWORD PTR [rbp-0xd0]
    1402: 83 c2 08              add    edx,0x8
    1405: 89 95 30 ff ff ff     mov    DWORD PTR [rbp-0xd0],edx
    140b: eb 12                 jmp    141f <funcvarargs+0xf1>
    140d: 48 8b 85 38 ff ff ff  mov    rax,QWORD PTR [rbp-0xc8]
    1414: 48 8d 50 08           lea    rdx,[rax+0x8]
    1418: 48 89 95 38 ff ff ff  mov    QWORD PTR [rbp-0xc8],rdx
    141f: 8b 00                 mov    eax,DWORD PTR [rax]
    1421: 01 85 2c ff ff ff     add    DWORD PTR [rbp-0xd4],eax
    1427: 83 85 28 ff ff ff 01  add    DWORD PTR [rbp-0xd8],0x1
    142e: 8b 85 28 ff ff ff     mov    eax,DWORD PTR [rbp-0xd8]
    1434: 3b 85 1c ff ff ff     cmp    eax,DWORD PTR [rbp-0xe4]
    143a: 7c a3                 jl     13df <funcvarargs+0xb1>
    143c: 8b 85 2c ff ff ff     mov    eax,DWORD PTR [rbp-0xd4]
    1442: 48 8b 8d 48 ff ff ff  mov    rcx,QWORD PTR [rbp-0xb8]
    1449: 64 48 33 0c 25 28 00  xor    rcx,QWORD PTR fs:0x28
    1450: 00 00
    1452: 74 05                 je     1459 <funcvarargs+0x12b>
    1454: e8 f7 fb ff ff        call   1050 <__stack_chk_fail@plt>
    1459: c9                    leave
    145a: c3                    ret
```

Observations

* We see that line `1366` tests the number of vector registers (SSE) that are
  used (`XMM0`-`XMM7`), and if it's not zero, then all registers are pushed on
  the stack.
* The code is much larger than for the 32-bit case, as the `va_list` either
  points to an array of saved registers, or to the callers stack. The ABI
  section 3.5.7 describes the data structure and algorithm in detail. This is
  because the code needs to push the register values on the stack locally, or
  use the callers stack, as needed.
* The register save area for this decompiled code is 176 bytes. The Sys V ABI
  defines 288 bytes, which this implementation doesn't use `XMM8`-`XMM15`.
  Adding 8 registers * 16 bytes to 176 gives 288 bytes.
* Don't use `varargs` if it can be avoided for high performance code.

The stack frame of `funcvarargs`, referenced by `RBP`, looks like

| Offset                | Value                                                |
| --------------------- | ---------------------------------------------------- |
| `qword ptr [RBP+32]`  | `RBP`                                                |
| `qword ptr [RBP+24]`  |                                                      |
| `qword ptr [RBP+16]`  |                                                      |
| `qword ptr [RBP+8]`   | Callers `RIP` return address                         |
| `qword ptr [RBP]`     | Callers `RBP` preserved by the callee `funcvarargs`  |
| `oword ptr [RBP-16]`  | `XMM7`                                               |
| `oword ptr [RBP-32]`  | `XMM6`                                               |
| `oword ptr [RBP-48]`  | `XMM5`                                               |
| `oword ptr [RBP-64]`  | `XMM4`                                               |
| `oword ptr [RBP-80]`  | `XMM3`                                               |
| `oword ptr [RBP-96]`  | `XMM2`                                               |
| `oword ptr [RBP-112]` | `XMM1`                                               |
| `oword ptr [RBP-128]` | `XMM0`                                               |
| `qword ptr [RBP-136]` | `R9`                                                 |
| `qword ptr [RBP-144]` | `R8`                                                 |
| `qword ptr [RBP-152]` | `RCX`                                                |
| `qword ptr [RBP-160]` | `RDX`                                                |
| `qword ptr [RBP-168]` | `RSI`                                                |
| `qword ptr [RBP-176]` | empty (defined as `RDI`)                             |
| `qword ptr [RBP-184]` | FS:0x28 stack guard                                  |
| `qword ptr [RBP-192]` | `va_list.reg_save_area`, initialized to `RBP-176`    |
| `qword ptr [RBP-200]` | `va_list.overflow_arg_area`, initialized to `RBP+16` |
| `dword ptr [RBP-204]` | `va_list.fp_offset` of 48 bytes offset to `RBP-128`  |
| `dword ptr [RBP-208]` | `va_list.gp_offset` of 8 bytes offset to `RBP-168`   |
| `dword ptr [RBP-212]` | `int j`                                              |
| `dword ptr [RBP-216]` | `int i`                                              |
| `dword ptr [RBP-220]` |                                                      |
| `dword ptr [RBP-224]` |                                                      |
| `dword ptr [RBP-228]` | `int cnt`, from `RDI`                                |
| `dword ptr [RBP-232]` |                                                      |
| `dword ptr [RBP-236]` |                                                      |
| `dword ptr [RBP-240]` | RSP points here                                      |
