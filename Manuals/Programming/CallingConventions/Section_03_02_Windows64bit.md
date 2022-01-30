## 64-bit Windows ABI

The Windows 64-bit ABI is the only calling convention used on Microsoft Windows.
Modifiers such as `__stdcall` and `__cdecl` are ignored for targets compiled for
the 64-bit platform.

Microsoft provide information about the 64-bit ABI on their
[Website](https://docs.microsoft.com/en-us/cpp/build/x64-software-conventions)
but it lacks some important information. A document provided by [Chris
Lomont](https://www.lomont.org/papers/2009/Introduction_to_x64_Assembly.pdf)
provides some more useful details but contains a few minor differences to here
in parameter passing.

### Naming Convention

When using `extern "C"`, the name of the function is the same as the function
itself.

Example:

`int myfunc(int a, int b, int c);`

→ `myfunc`

### Parameter Passing and Return Values

Arguments are first passed via registers, remaining arguments are passed via the
stack.

* The first argument is passed in `RCX` (for an integer type value) or in `XMM0`
  (for a float or double). The second argument in `RDX` or `XMM1`; the third in
  `R8` or `XMM2`; and the fourth in `R9` or `Xmm3`.
* If integers being passed in `RCX`, `RDX`, `R8` or `R9` don't consume the full
  64-bit register, the upper bits are undefined (may contain garbage).
* Additional arguments are pushed on the stack from right to left from the last
  argument to the fifth argument. As the stack grows down, it will appear in
  memory that argument 5 is before argument 6 (argument 5 has a smaller offset
  to `RSP` than argument 6).
* The caller always reserves 32 bytes (4 arguments) on the stack, so that the
  callee can use this space to make a shadow copy of the first four arguments if
  required. It is the responsibility of the callee to copy data from the
  registers to the shadow space if needed.

Return Values are given in registers.

* Integers are returned in `RAX`
* Floats and doubles are returned in `XMM0`

| Parameter Tyep                               | How Passed                                                                        |
| -------------------------------------------- | --------------------------------------------------------------------------------- |
| Floating Point                               | First 4 parameters - `XMM0` through to `XMM3`. Others are passed on the stack.    |
| Integer                                      | First 4 parameters - `RCX`, `RDX`, `R8`, `R9`. Others are passed on the stack.    |
| Aggregates (8, 16, 32 or 64 bit) and `__m64` | First 4 parameters - `RCX`, `RDX`, `R8`, `R9`. Others are passed on the stack.    |
| Aggregates (other)                           | By pointer. First 4 parameters passed as pointers in `RCX`, `RDX`, `R8` and `R9`. |
| `__m128`                                     | By pointer. First 4 parameters passed as pointers in `RCX`, `RDX`, `R8` and `R9`. |

The stack is handled in the following ways:

* Cleaning up the stack is done by the caller. The callee calls the `ret`
  instruction, only cleaning up the stack for its own local usage.
* The stack must be 16-byte aligned. The `call` instruction pushes an 8-byte
  return value, so all non-leaf functions must adjust the stack by a value of
  the form 16n+8 when allocating stack space. Non-leaf functions are those that
  might call other functions.
* When calling a function, the minimum amount of stack used is 48 bytes (32
  bytes for shadow parameters, 8 bytes for the `RIP` return instruction pointer
  and 8 bytes for 16-byte alignment.

Returning structs by value that are greater than 64-bits are handled similarly
to stdcall.

* The caller allocates space for the return struct.
* The first parameter (so in `RCX`) contains the pointer to the struct being
  returned and is given to the callee.
* All other paramters are shifted to the right by one. That is, the first
  parameter is now passed in `RDX`, up to the third parameter (`R8` and then
  `R9`) with remaining parameters pushed on to the stack.
* On return, the `RAX` register contains the pointer to the struct being
  returned.
* The caller is responsible for cleaning up the stack space allocated for the
  return struct, conistent with above.

Variable argument lists are supported by the Windows 64-bit ABI.

### Scratch Registers

The following registers are considered scratch:

| Register                       | Description                                             |
| ------------------------------ | ------------------------------------------------------- |
| `RAX`, `XMM0`                  | Return Value                                            |
| `RCX`, `RDX`, `R8`, `R9`       | First, second, third and fourth argument                |
| `R10`, `R11`                   | Used in syscall/sysret functions                        |
| `XMM0`, `XMM1`, `XMM2`, `XMM3` | First, second, third and fourth floating point argument |
| `XMM4`, `XMM5`                 |                                                         |

The remaining registers must be preserved by the function call: `RBX`, `RDI`,
`RSI`, `RBP`, `R12`-`R15`, `XMM6`-`XMM15`.

### Examples

A project is created in Visual Studio 2012, compiled as a standard Console
program. The `dumpbin.exe` program is used to disassemble the compiled program.
The project is compiled for Release with whole program optimisation turned off,
so that functions between modules are not inlined.

#### Simplest Case, Integer Return

The simplest case shows how integers are returned in `RAX`.

```c
int  myFunc(void)
{
  return 42;
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc();
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: E8 17 00 00 00     call        myFunc
  0000000140001009: 83 C0 02           add         eax,2
  000000014000100C: 48 83 C4 28        add         rsp,28h
  0000000140001010: C3                 ret

myFunc:
  0000000140001020: B8 2A 00 00 00     mov         eax,2Ah
  0000000140001025: C3                 ret
```

Observations

* The return value is provided in `RAX` in the lower 32-bits (`EAX`). The `mov`
  instruction sign extends to the upper 32-bits in 64-bit mode.
* Stack space for 32 bytes are allocated (the first four parameters), plus 8
  bytes, so that with the `call` instruction, the stack is aligned to 16-bytes
  by the callee.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                         |
| -------------------- | ----------------------------- |
| `qword ptr [RSP+40]` | not used                      |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used) |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used) |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used) |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used) |
| `qword ptr [RSP]`    | Callers `RIP` return address  |
| `xxx ptr [RSP-x]`    | Local stack variables         |

#### 64-bit return value

```c
__int64 myFunc(void)
{
  return 0x12345678ABCDEF01L;
}

int _tmain(int argc, _TCHAR* argv[])
{
  return (int)myFunc() + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: E8 17 00 00 00     call        myFunc
  0000000140001009: 83 C0 02           add         eax,2
  000000014000100C: 48 83 C4 28        add         rsp,28h
  0000000140001010: C3                 ret

myFunc:
  0000000140001020: 48 B8 01 EF CD AB  mov         rax,12345678ABCDEF01h
                    78 56 34 12
  000000014000102A: C3                 ret
```

Observations

* The return value is provided in `RAX`.
* Stack space for 32 bytes are allocated (the first four parameters), plus 8
  bytes, so that with the `call` instruction, the stack is aligned to 16-bytes
  by the callee.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                         |
| -------------------- | ----------------------------- |
| `qword ptr [RSP+40]` | not used                      |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used) |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used) |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used) |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used) |
| `qword ptr [RSP]`    | Callers `RIP` return address  |
| `xxx ptr [RSP-x]`    | Local stack variables         |

#### Two Integers

```c
int myFunc(int a, int b)
{
  return (a + 1) * (b + 2);
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1, 2) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: BA 02 00 00 00     mov         edx,2
  0000000140001009: 8D 4A FF           lea         ecx,[rdx-1]
  000000014000100C: E8 0F 00 00 00     call        myFunc
  0000000140001011: 83 C0 02           add         eax,2
  0000000140001014: 48 83 C4 28        add         rsp,28h
  0000000140001018: C3                 ret

myFunc:
  0000000140001020: 8D 41 01           lea         eax,[rcx+1]
  0000000140001023: 8D 4A 02           lea         ecx,[rdx+2]
  0000000140001026: 0F AF C1           imul        eax,ecx
  0000000140001029: C3                 ret
```

Observations

* Stack space for 32 bytes are allocated (the first four parameters), plus 8
  bytes, so that with the `call` instruction, the stack is aligned to 16-bytes
  by the callee.
* The register `RCX` contains the first parameter with the value 1. The upper
  32-bits are undefined (as the type is a 32-bit value).
* The register `RDX` contains the second parameter, the upper 32-bits are
  undefined (as the type is a 32-bit value).

The stack in the caller, based on `RSP` looks like

| Offset               | Value                         |
| -------------------- | ----------------------------- |
| `qword ptr [RSP+40]` | not used                      |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used) |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used) |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used) |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used) |
| `qword ptr [RSP]`    | Callers `RIP` return address  |
| `xxx ptr [RSP-x]`    | Local stack variables         |

#### Mixed Floats and Integers

```c
int myFunc(float a, int b, float c, int d)
{
  return (a + 1) * (b + 2) + (c + 3) * (d + 4);
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1.0, 2, 3.0, 4) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: F3 0F 10 15 60 11  movss       xmm2,dword ptr [__real@40400000]
                    00 00
  000000014000100C: F3 0F 10 05 54 11  movss       xmm0,dword ptr [__real@3f800000]
                    00 00
  0000000140001014: 41 B9 04 00 00 00  mov         r9d,4
  000000014000101A: 41 8D 51 FE        lea         edx,[r9-2]
  000000014000101E: E8 0D 00 00 00     call        myFunc
  0000000140001023: 83 C0 02           add         eax,2
  0000000140001026: 48 83 C4 28        add         rsp,28h
  000000014000102A: C3                 ret

myFunc:
  0000000140001030: F3 0F 58 05 30 11  addss       xmm0,dword ptr [__real@3f800000]
                    00 00
  0000000140001038: F3 0F 58 15 2C 11  addss       xmm2,dword ptr [__real@40400000]
                    00 00
  0000000140001040: 8D 42 02           lea         eax,[rdx+2]
  0000000140001043: 66 0F 6E C8        movd        xmm1,eax
  0000000140001047: 41 8D 41 04        lea         eax,[r9+4]
  000000014000104B: 0F 5B C9           cvtdq2ps    xmm1,xmm1
  000000014000104E: F3 0F 59 C1        mulss       xmm0,xmm1
  0000000140001052: 66 0F 6E C8        movd        xmm1,eax
  0000000140001056: 0F 5B C9           cvtdq2ps    xmm1,xmm1
  0000000140001059: F3 0F 59 D1        mulss       xmm2,xmm1
  000000014000105D: F3 0F 58 C2        addss       xmm0,xmm2
  0000000140001061: F3 0F 2C C0        cvttss2si   eax,xmm0
  0000000140001065: C3                 ret
```

Observations:

* Parameter 1 is in `XMM0`, parameter 2 is in `RDX`, parameter 3 is in `XMM2`
  and parameter 4 is in `R9`.
* Enough stack space is allocated for the four parameters, plus 8 bytes to align
  the stack in the caller by 16-bytes.
* The 32-bit return value is given in `RAX`.

#### Mixed Floats and Integers, 5 parameters

```c
int myFunc(float a, int b, float c, int d, float e)
{
  return (int)((a + 1.0) * (b + 2) + (c + 3.0) * (d + 4) * (e * 5.0));
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1.0, 2, 3.0, 4, 5.0) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 38        sub         rsp,38h
  0000000140001004: F3 0F 10 05 64 11  movss       xmm0,dword ptr [__real@40a00000]
                    00 00
  000000014000100C: F3 0F 10 15 58 11  movss       xmm2,dword ptr [__real@40400000]
                    00 00
  0000000140001014: 41 B9 04 00 00 00  mov         r9d,4
  000000014000101A: 41 8D 51 FE        lea         edx,[r9-2]
  000000014000101E: F3 0F 11 44 24 20  movss       dword ptr [rsp+20h],xmm0
  0000000140001024: F3 0F 10 05 3C 11  movss       xmm0,dword ptr [__real@3f800000]
                    00 00
  000000014000102C: E8 0F 00 00 00     call        myFunc
  0000000140001031: 83 C0 02           add         eax,2
  0000000140001034: 48 83 C4 38        add         rsp,38h
  0000000140001038: C3                 ret

myFunc:
  0000000140001040: 0F 57 DB           xorps       xmm3,xmm3
  0000000140001043: 41 8D 41 04        lea         eax,[r9+4]
  0000000140001047: F3 0F 5A DA        cvtss2sd    xmm3,xmm2
  000000014000104B: F3 0F 10 54 24 28  movss       xmm2,dword ptr [rsp+28h]
  0000000140001051: 66 0F 6E C8        movd        xmm1,eax
  0000000140001055: 8D 42 02           lea         eax,[rdx+2]
  0000000140001058: F2 0F 58 1D 20 11  addsd       xmm3,mmword ptr [__real@4008000000000000]
                    00 00
  0000000140001060: 0F 5A D2           cvtps2pd    xmm2,xmm2
  0000000140001063: F2 0F 59 15 1D 11  mulsd       xmm2,mmword ptr [__real@4014000000000000]
                    00 00
  000000014000106B: F3 0F E6 C9        cvtdq2pd    xmm1,xmm1
  000000014000106F: F2 0F 59 D9        mulsd       xmm3,xmm1
  0000000140001073: 0F 57 C9           xorps       xmm1,xmm1
  0000000140001076: F3 0F 5A C8        cvtss2sd    xmm1,xmm0
  000000014000107A: 66 0F 6E C0        movd        xmm0,eax
  000000014000107E: F2 0F 58 0D F2 10  addsd       xmm1,mmword ptr [__real@3ff0000000000000]
                    00 00
  0000000140001086: F2 0F 59 DA        mulsd       xmm3,xmm2
  000000014000108A: F3 0F E6 C0        cvtdq2pd    xmm0,xmm0
  000000014000108E: F2 0F 59 C8        mulsd       xmm1,xmm0
  0000000140001092: F2 0F 58 D9        addsd       xmm3,xmm1
  0000000140001096: F2 0F 2C C3        cvttsd2si   eax,xmm3
  000000014000109A: C3                 ret
```

Observations:

* Parameter 1 is in `XMM0`, parameter 2 is in `RDX`, parameter 3 is in `XMM2`
  and parameter 4 is in `R9`.
* Enough stack space is allocated for the four parameters, plus 16 bytes.
* The fifth parameter is pushed on the stack at instruction 14000101E.
* The 32-bit return value is given in `RAX`.
* Register `XMM3` is considered scratch in the callee.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                                  |
| -------------------- | -------------------------------------- |
| `qword ptr [RSP+56]` |                                        |
| `qword ptr [RSP+48]` |                                        |
| `qword ptr [RSP+40]` | Parameter 5 (at instruction 14000101E) |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used)          |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used)          |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used)          |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used)          |
| `qword ptr [RSP]`    | Callers `RIP` return address           |
| `xxx ptr [RSP-x]`    | Local stack variables                  |

#### Mixed Floats and Integers, 6 parameters

The ordering of parameters after the 4th parameter are shown in this example.

```c
int myFunc(float a, int b, float c, int d, float e, double f)
{
  return (int)((a + 1.0) * (b + 2) + (c + 3.0) * (d + 4) * (e * 5.0) * f);
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1.0, 2, 3.0, 4, 5.0, 6.0) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 38        sub         rsp,38h
  0000000140001004: F2 0F 10 05 64 11  movsd       xmm0,mmword ptr [__real@4018000000000000]
                    00 00
  000000014000100C: F3 0F 10 0D 68 11  movss       xmm1,dword ptr [__real@40a00000]
                    00 00
  0000000140001014: F3 0F 10 15 5C 11  movss       xmm2,dword ptr [__real@40400000]
                    00 00
  000000014000101C: 41 B9 04 00 00 00  mov         r9d,4
  0000000140001022: 41 8D 51 FE        lea         edx,[r9-2]
  0000000140001026: F2 0F 11 44 24 28  movsd       mmword ptr [rsp+28h],xmm0
  000000014000102C: F3 0F 10 05 34 11  movss       xmm0,dword ptr [__real@3f800000]
                    00 00
  0000000140001034: F3 0F 11 4C 24 20  movss       dword ptr [rsp+20h],xmm1
  000000014000103A: E8 11 00 00 00     call        myFunc
  000000014000103F: 83 C0 02           add         eax,2
  0000000140001042: 48 83 C4 38        add         rsp,38h
  0000000140001046: C3                 ret

myFunc:
  0000000140001050: 0F 57 DB           xorps       xmm3,xmm3
  0000000140001053: 41 8D 41 04        lea         eax,[r9+4]
  0000000140001057: F3 0F 5A DA        cvtss2sd    xmm3,xmm2
  000000014000105B: F3 0F 10 54 24 28  movss       xmm2,dword ptr [rsp+28h]
  0000000140001061: 66 0F 6E C8        movd        xmm1,eax
  0000000140001065: 8D 42 02           lea         eax,[rdx+2]
  0000000140001068: F2 0F 58 1D 18 11  addsd       xmm3,mmword ptr [__real@4008000000000000]
                    00 00
  0000000140001070: 0F 5A D2           cvtps2pd    xmm2,xmm2
  0000000140001073: F2 0F 59 15 15 11  mulsd       xmm2,mmword ptr [__real@4014000000000000]
                    00 00
  000000014000107B: F3 0F E6 C9        cvtdq2pd    xmm1,xmm1
  000000014000107F: F2 0F 59 D9        mulsd       xmm3,xmm1
  0000000140001083: 0F 57 C9           xorps       xmm1,xmm1
  0000000140001086: F3 0F 5A C8        cvtss2sd    xmm1,xmm0
  000000014000108A: 66 0F 6E C0        movd        xmm0,eax
  000000014000108E: F2 0F 58 0D EA 10  addsd       xmm1,mmword ptr [__real@3ff0000000000000]
                    00 00
  0000000140001096: F2 0F 59 DA        mulsd       xmm3,xmm2
  000000014000109A: F2 0F 59 5C 24 30  mulsd       xmm3,mmword ptr [rsp+30h]
  00000001400010A0: F3 0F E6 C0        cvtdq2pd    xmm0,xmm0
  00000001400010A4: F2 0F 59 C8        mulsd       xmm1,xmm0
  00000001400010A8: F2 0F 58 D9        addsd       xmm3,xmm1
  00000001400010AC: F2 0F 2C C3        cvttsd2si   eax,xmm3
  00000001400010B0: C3                 ret
```

Observations:

* Parameter 1 is in `XMM0`, parameter 2 is in `RDX`, parameter 3 is in `XMM2`
  and parameter 4 is in `R9`.
* Enough stack space is allocated for the four parameters, plus 8 bytes to align
  the stack in the caller by 16-bytes.
* The fifth parameter is pushed on the stack at instruction `14000101E`.
* The 32-bit return value is given in `RAX`.
* Register `XMM3` is considered scratch in the callee.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                               |
| -------------------- | ----------------------------------- |
| `qword ptr [RSP+56]` |                                     |
| `qword ptr [RSP+48]` | Parameter 6 (instruction 140001026) |
| `qword ptr [RSP+40]` | Parameter 5 (instruction 140001034) |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used)       |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used)       |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used)       |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used)       |
| `qword ptr [RSP]`    | Callers `RIP` return address        |
| `xxx ptr [RSP-x]`    | Local stack variables               |

#### Doubles

We see that doubles are handled the same as floats.

```c
double myFunc(double a, double b)
{
  return (a + 1.0) * (b + 2.0);
}

int _tmain(int argc, _TCHAR* argv[])
{
  return (int)myFunc(1.0, 2.0) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: F2 0F 10 0D 64 11  movsd       xmm1,mmword ptr [__real@4000000000000000]
                    00 00
  000000014000100C: F2 0F 10 05 54 11  movsd       xmm0,mmword ptr [__real@3ff0000000000000]
                    00 00
  0000000140001014: E8 17 00 00 00     call        myFunc
  0000000140001019: F2 0F 2C C0        cvttsd2si   eax,xmm0
  000000014000101D: 83 C0 02           add         eax,2
  0000000140001020: 48 83 C4 28        add         rsp,28h
  0000000140001024: C3                 ret

myFunc:
  0000000140001030: F2 0F 58 05 30 11  addsd       xmm0,mmword ptr [__real@3ff0000000000000]
                    00 00
  0000000140001038: F2 0F 58 0D 30 11  addsd       xmm1,mmword ptr [__real@4000000000000000]
                    00 00
  0000000140001040: F2 0F 59 C1        mulsd       xmm0,xmm1
  0000000140001044: C3                 ret
```

Observations:

* Parameter 1 is in `XMM0`, parameter 2 is in `XMM1`.
* Enough stack space is allocated for the four parameters, plus 8 bytes to align
  the stack in the caller by 16-bytes.
* The result is returned in `XMM0`. The caller then converts this to an integer
  as in `_tmain`.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                         |
| -------------------- | ----------------------------- |
| `qword ptr [RSP+40]` |                               |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used) |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used) |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used) |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used) |
| `qword ptr [RSP]`    | Callers `RIP` return address  |
| `xxx ptr [RSP-x]`    | Local stack variables         |

#### Structs by Value

A struct is passed as a pointer. The caller is responsible for making a copy of
the original struct so if it's modified by the callee, the changes aren't
propogated in the original copy.

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

int myFunc(struct mystruct x, struct mystruct *y)
{
  return x.a + y->b;
}

int _tmain(int argc, _TCHAR* argv[])
{
  struct mystruct a = {0, };
  struct mystruct b = {0, };

  return myFunc(a, &b) + 2;
}
```

```asm
wmain:
  0000000140001000: 4C 8B DC           mov         r11,rsp
  0000000140001003: 48 81 EC 88 00 00  sub         rsp,88h
                    00
  000000014000100A: 48 8B 05 EF 1F 00  mov         rax,qword ptr [__security_cookie]
                    00
  0000000140001011: 48 33 C4           xor         rax,rsp
  0000000140001014: 48 89 44 24 78     mov         qword ptr [rsp+78h],rax
  0000000140001019: 33 C0              xor         eax,eax
  000000014000101B: 33 C9              xor         ecx,ecx
  000000014000101D: 49 8D 53 D8        lea         rdx,[r11-28h]
  0000000140001021: 49 89 4B 98        mov         qword ptr [r11-68h],rcx
  0000000140001025: 49 89 43 A0        mov         qword ptr [r11-60h],rax
  0000000140001029: 49 89 43 A8        mov         qword ptr [r11-58h],rax
  000000014000102D: 0F 10 44 24 20     movups      xmm0,xmmword ptr [rsp+20h]
  0000000140001032: F2 0F 10 4C 24 30  movsd       xmm1,mmword ptr [rsp+30h]
  0000000140001038: 49 89 4B D8        mov         qword ptr [r11-28h],rcx
  000000014000103C: 49 8D 4B B8        lea         rcx,[r11-48h]
  0000000140001040: 49 89 43 E0        mov         qword ptr [r11-20h],rax
  0000000140001044: 0F 29 44 24 40     movaps      xmmword ptr [rsp+40h],xmm0
  0000000140001049: F2 0F 11 4C 24 50  movsd       mmword ptr [rsp+50h],xmm1
  000000014000104F: 49 89 43 E8        mov         qword ptr [r11-18h],rax
  0000000140001053: E8 18 00 00 00     call        myFunc
  0000000140001058: 83 C0 02           add         eax,2
  000000014000105B: 48 8B 4C 24 78     mov         rcx,qword ptr [rsp+78h]
  0000000140001060: 48 33 CC           xor         rcx,rsp
  0000000140001063: E8 A8 00 00 00     call        __security_check_cookie
  0000000140001068: 48 81 C4 88 00 00  add         rsp,88h
                    00
  000000014000106F: C3                 ret

myFunc:
  0000000140001070: 8B 42 04           mov         eax,dword ptr [rdx+4]
  0000000140001073: 03 01              add         eax,dword ptr [rcx]
  0000000140001075: C3                 ret
```

Observations:

* The compiler uses `R11` as the stack frame base pointer instead of `RBP`. This
  is likely as `R11` is a scratch register and it saves some instructions to
  push and pop `RBP` on/off the stack.
* The structure at address `RSP`+40 is copied to `RSP`+72, making a copy of
  `struct a` for use in the function as `struct x`.
* Parameter 1 in `RCX` is the address of `struct x`, which is a copy of `struct
  a`, created by the caller for the callee.
* Parameter 2 in `RDX` is the address of `struct b`, passed by reference to the
  callee.
* The structures are aligned on 16-byte boundaries.

The stack in the caller, based on `RSP` looks like

| Offset                | Value                                     |
| --------------------- | ----------------------------------------- |
| `qword ptr [RSP+136]` |                                           |
| `qword ptr [RSP+128]` | cookie XOR `RSP` at instruction 140001011 |
| `qword ptr [RSP+120]` | y.e, y.f                                  |
| `qword ptr [RSP+112]` | y.c, y.d                                  |
| `qword ptr [RSP+104]` | Struct y.a, y.b                           |
| `qword ptr [RSP+96]`  |                                           |
| `qword ptr [RSP+88]`  | x.e, x.f                                  |
| `qword ptr [RSP+80]`  | x.c, x.d                                  |
| `qword ptr [RSP+72]`  | Struct x.a, x.b                           |
| `qword ptr [RSP+64]`  |                                           |
| `qword ptr [RSP+56]`  | a.e, a.f                                  |
| `qword ptr [RSP+48]`  | a.c, a.d                                  |
| `qword ptr [RSP+40]`  | Struct a.a, a.b                           |
| `qword ptr [RSP+32]`  | Shadow parameter 4 (not used)             |
| `qword ptr [RSP+24]`  | Shadow parameter 3 (not used)             |
| `qword ptr [RSP+16]`  | Shadow parameter 2 (not used)             |
| `qword ptr [RSP+8]`   | Shadow parameter 1 (not used)             |
| `qword ptr [RSP]`     | Callers `RIP` return address              |
| `xxx ptr [RSP-x]`     | Local stack variables                     |

#### Return Struct by Value

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

struct mystruct myFunc(void)
{
  struct mystruct x = {0, 1, 2, 3, 4, 5};
  return x;
}

int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc().a + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 58        sub         rsp,58h
  0000000140001004: 48 8D 4C 24 38     lea         rcx,[rsp+38h]
  0000000140001009: E8 22 00 00 00     call        myFunc
  000000014000100E: 48 8B 48 08        mov         rcx,qword ptr [rax+8]
  0000000140001012: 48 8B 10           mov         rdx,qword ptr [rax]
  0000000140001015: 48 8B 40 10        mov         rax,qword ptr [rax+10h]
  0000000140001019: 48 89 44 24 30     mov         qword ptr [rsp+30h],rax
  000000014000101E: 48 89 4C 24 28     mov         qword ptr [rsp+28h],rcx
  0000000140001023: 8D 42 02           lea         eax,[rdx+2]
  0000000140001026: 48 83 C4 58        add         rsp,58h
  000000014000102A: C3                 ret

myFunc:
  0000000140001030: C7 01 00 00 00 00  mov         dword ptr [rcx],0
  0000000140001036: C7 41 04 01 00 00  mov         dword ptr [rcx+4],1
                    00
  000000014000103D: C7 41 08 02 00 00  mov         dword ptr [rcx+8],2
                    00
  0000000140001044: C7 41 0C 03 00 00  mov         dword ptr [rcx+0Ch],3
                    00
  000000014000104B: C7 41 10 04 00 00  mov         dword ptr [rcx+10h],4
                    00
  0000000140001052: C7 41 14 05 00 00  mov         dword ptr [rcx+14h],5
                    00
  0000000140001059: 48 8B C1           mov         rax,rcx
  000000014000105C: C3                 ret
```

Observations:

* The caller is responsible for allocating space on the stack for the return
  value.
* The return value is passed as the first parameter on `RCX`. It's not shown
  here, but all other parameters are then shifted to the right by one (so
  parameter 1 would then be passed on `RDX`, etc.)
* As in the `stdcall` calling convention, the return value (in `RAX` is a
  pointer to the struct (parameter 1) given.
* The struct for returning is aligned to a 16-byte boundary.

The stack in the caller, based on `RSP` looks like

| Offset               | Value                             |
| -------------------- | --------------------------------- |
| `qword ptr [RSP+96]` |                                   |
| `qword ptr [RSP+88]` |                                   |
| `qword ptr [RSP+80]` | return struct                     |
| `qword ptr [RSP+72]` | return struct                     |
| `qword ptr [RSP+64]` | Return struct allocated by caller |
| `qword ptr [RSP+56]` |                                   |
| `qword ptr [RSP+48]` |                                   |
| `qword ptr [RSP+40]` |                                   |
| `qword ptr [RSP+32]` | Shadow parameter 4 (not used)     |
| `qword ptr [RSP+24]` | Shadow parameter 3 (not used)     |
| `qword ptr [RSP+16]` | Shadow parameter 2 (not used)     |
| `qword ptr [RSP+8]`  | Shadow parameter 1 (not used)     |
| `qword ptr [RSP]`    | Callers `RIP` return address      |
| `xxx ptr [RSP-x]`    | Local stack variables             |

#### Variable Number of Arguments

There are multiple examples provided here to analyse the behaviour of the
compiler. We see that the callee must provide a mechanism so that the caller can
indicate how many arguments are expected to be on the stack.

By looking at the behaviour here, it is easy to see why a variable number of
arguments can cause program crashes. So long as the callee access more arguments
than are defined, it may start to access information such as the return pointer
for previous functions due to previous stack frames.

```c
int myFunc(int cnt, ...)
{
  va_list argptr;
  va_start(argptr, cnt);
  int i, j = 0;

  for (i = 0; i < cnt; i++) j += va_arg(argptr, int);
  return j;
}
```

```asm
myFunc:
  0000000140001030: 89 4C 24 08        mov         dword ptr [rsp+8],ecx
  0000000140001034: 48 89 54 24 10     mov         qword ptr [rsp+10h],rdx
  0000000140001039: 33 C0              xor         eax,eax
  000000014000103B: 4C 89 44 24 18     mov         qword ptr [rsp+18h],r8
  0000000140001040: 48 8D 54 24 10     lea         rdx,[rsp+10h]
  0000000140001045: 4C 89 4C 24 20     mov         qword ptr [rsp+20h],r9
  000000014000104A: 85 C9              test        ecx,ecx
  000000014000104C: 7E 12              jle         0000000140001060
  000000014000104E: 48 83 C2 F8        add         rdx,0FFFFFFFFFFFFFFF8h
  0000000140001052: 8B C9              mov         ecx,ecx
  0000000140001054: 03 42 08           add         eax,dword ptr [rdx+8]
  0000000140001057: 48 8D 52 08        lea         rdx,[rdx+8]
  000000014000105B: 48 FF C9           dec         rcx
  000000014000105E: 75 F4              jne         0000000140001054
  0000000140001060: F3 C3              rep ret
```

The code remains the same indendent of the function being called. Let's look at
the function implementing a variable number of arguments.

* Here we see the compiler, for the first time, making use of the shadow
  parameters, putting the results on the stack (instructions `140001030` to
  `140001045`). This simplifies the processing of a variable number of arguments
  later.
* If the parameter `cnt` in register `RCX` is negative, it exits with the `rep
  ret` instruction.
* It subtracts 8 bytes from the `RDP` register (which was initialised to the
  first parameter on the stack, as initialised in step 1).
* The result is added with the parameter on the stack and `RDP` is updated to
  point to the next parameter variable.
* The counter `ECX` is decremented.

So we see there is no implicit information given by the compiler about how many
parameters were provided. This is entirely up to the `caller` to specify how
many arguments the callee should handle. The `callee` may still pass up to the
first four parameters via registers only without having to copy them onto the
stack.

##### One Single Argument

The case that a single integer is provided without any variable number of
arguments.

```c
int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(0)+2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: 33 C9              xor         ecx,ecx
  0000000140001006: E8 15 00 00 00     call        myFunc
  000000014000100B: 83 C0 02           add         eax,2
  000000014000100E: 48 83 C4 28        add         rsp,28h
  0000000140001012: C3                 ret
```

Observations:

* Space is allocated for the shadow parameters.
* A single parameter is provided in `RCX`, consistent with a function only
  accepting one parameter.

##### Two arguments

The case that a single integer is provided without any variable number of
arguments.

```c
int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1, 1) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 28        sub         rsp,28h
  0000000140001004: BA 01 00 00 00     mov         edx,1
  0000000140001009: 8B CA              mov         ecx,edx
  000000014000100B: E8 10 00 00 00     call        myFunc
  0000000140001010: 83 C0 02           add         eax,2
  0000000140001013: 48 83 C4 28        add         rsp,28h
  0000000140001017: C3                 ret
```

Observations:

* Space is allocated for the shadow parameters.
* Two parameters are provided in `RCX` and `RDX`, consistent with a function
  only accepting two parameters.

##### Nine arguments

We pass a large number of arguments on to the stack.

```c
int _tmain(int argc, _TCHAR* argv[])
{
  return myFunc(1, 1) + 2;
}
```

```asm
wmain:
  0000000140001000: 48 83 EC 58        sub         rsp,58h
  0000000140001004: BA 01 00 00 00     mov         edx,1
  0000000140001009: C7 44 24 40 08 00  mov         dword ptr [rsp+40h],8
                    00 00
  0000000140001011: C7 44 24 38 07 00  mov         dword ptr [rsp+38h],7
                    00 00
  0000000140001019: C7 44 24 30 06 00  mov         dword ptr [rsp+30h],6
                    00 00
  0000000140001021: 44 8D 4A 02        lea         r9d,[rdx+2]
  0000000140001025: 44 8D 42 01        lea         r8d,[rdx+1]
  0000000140001029: 8D 4A 07           lea         ecx,[rdx+7]
  000000014000102C: C7 44 24 28 05 00  mov         dword ptr [rsp+28h],5
                    00 00
  0000000140001034: C7 44 24 20 04 00  mov         dword ptr [rsp+20h],4
                    00 00
  000000014000103C: E8 0F 00 00 00     call        myFunc
  0000000140001041: 83 C0 02           add         eax,2
  0000000140001044: 48 83 C4 58        add         rsp,58h
  0000000140001048: C3                 ret
```

Observations:

* Space is allocated for the shadow parameters. Arguments 5-9 are copied onto
  the stack.
* The caller is responsible for knowing how many arguments are placed on the
  stack

The stack in the caller, based on `RSP` looks like

| Offset               | Value                           |
| -------------------- | ------------------------------- |
| `qword ptr [RSP+96]` |                                 |
| `qword ptr [RSP+88]` |                                 |
| `qword ptr [RSP+80]` |                                 |
| `qword ptr [RSP+72]` | Parameter 9                     |
| `qword ptr [RSP+64]` | Paramater 8                     |
| `qword ptr [RSP+56]` | Parameter 7                     |
| `qword ptr [RSP+48]` | Parameter 6                     |
| `qword ptr [RSP+40]` | Parameter 5                     |
| `qword ptr [RSP+32]` | Parameter 4 (copied from `R9`)  |
| `qword ptr [RSP+24]` | Parameter 3 (copied from `R8`)  |
| `qword ptr [RSP+16]` | Parameter 2 (copied from `RDX`) |
| `qword ptr [RSP+8]`  | Parameter 1 (copied from `RCX`) |
| `qword ptr [RSP]`    | Callers `RIP` return address    |
| `xxx ptr [RSP-x]`    | Local stack variables           |
