## stdcall: Standard Calling Convention

The `stdcall` calling convention is that which is specified for Windows DLLs
through the `WINAPI` macro. the standard calling convention doesn’t support
variable argument lists.

Examples provided here are generated using Microsoft Visual Studio 2012. Default
settings are used for compiling the code. In some cases, a specific machine
architecture is provided to disable SSE instructions (with the `/arch:ia32`
option). Dumping of the object code in assembly is done using the Microsoft tool
`dumpbin.exe`.

This tool shows code in the Microsoft Macro Assembler format (so that code is
shown in the Intel syntax).

```text
> set MSVC=C:\Program Files\Microsoft Visual Studio 11.0
> set PATH=%MSVC%\Common7\IDE;%MSVC%\VC\bin;%PATH%
> dumpbin test.exe /disasm /out:test.asm
```

### Naming Convention

Functions exported for linking are prefixed with an underscore (`_`), followed
by an at symbol (`@`) and the number of bytes the parameter list uses on the
stack (in decimal). The following sections will have various examples on the
naming convention. Listed below are some examples to illustrate the point:

* Three integers in parameter list

  `int myfunc(int a, int b, int c);`

  → `_myfunc@12`

* An empty parameter list

  `void myfuncv();`

  → `_myfuncv@0`

* Struct return by value

  `struct mystruct myfuncs();`

  → `_myfuncs@0`

  `struct mystruct myfuncs(int x, int y);`

  → `_myfuncs@8`

* Doubles

  `double myfuncs(double a, double b);`

  → `_myfuncs@16`

Windows compilers can be told to ignore the naming conventions, providing
symbols that are named directly after the function without being decorated with
parameter information. This is often useful for platform interoperability.

### Parameter Passing and Return Values

Arguments are passed on the main stack (given by the register `ESP`):

* order is from right to left. That is, push the far right argument on the stack
  first, the first argument is then pushed last;
* floating point variables (double and float) are also pushed on the main stack
  given by `ESP` (not the FPU stack);
  * floats are 4 bytes, doubles are 8 bytes
* variable number of arguments (varargs) are not supported by the stdcall
  calling convention;
  * This is because the callee must clean up the stack.

Return values (8 bytes or less) are given on exit in registers:

* 32-bit integers are returned in the register `EAX`;
* 64-bit values are returned by `EDX:EAX` (e.g. like the result of the x86
  `imul` instruction, where the lower 32-bits are in EAX and the upper 32-bits
  are in `EDX`);
* `float`s and `double`s are returned on the FPU stack (`ST(0)`).

Cleaning up the stack is done by the callee.

* This is typically done with the `ret` instruction which has an optional
  parameter to determine how many bytes to pop from the stack before returning.
  For example, if 24 bytes are pushed on the stack, then typically compilers
  produce `ret 24` and the end of the callee.
* Values returned on the stack are covered next

Returning structs by value that are greater than 64-bits are handled in a
special manner and deserve explicit attention:

* The caller allocates space for the struct that is returned by value.

  This may look a little strange, when comparing how C programs are written,
  where the callee normally has code that would appear to allocate stack space
  instead.

* The caller then passes a pointer to the struct on the stack last, as if it
  were the first parameter.
* On return, EAX contains the pointer to the struct given in the first
  parameter.
* The callee is responsible for popping the pointer to the struct in addition.
* The function signature contains the number of bytes excluding the pointer to
  the struct, as seen here

  `struct mystruct myfuncs(int x, int y);`

  → `_myfuncs@8`

  So even though 12 bytes should be pushed on the stack (plus space should be
  allocated for the struct value in addition), the function signature shows only
  8 bytes. The function still removes 12 bytes from the stack on returning with
  a `ret 12` instruction.

### Scratch Registers

The following registers are considered scratch registers, the callee does not
need to preserve them on exit. The caller should preserve these registers in
case they’re needed on return.

* `EAX` - Return value for integers (lower 32-bits)
* `EDX` - Return value for 64-bit integers, otherwise don’t care
* `ECX`

All other registers must be preserved by the callee: `EBP`, `EBX`, `EDI`, `ESI`.
Registers `EIP` and `ESP` need to be preserved as described earlier.

### Examples

#### Two Integers

The callee accepts two 4-byte (signed) integers. The caller is the function
`DllMain`. The callee takes the parameters, adds a fixed value and multiplies
them, so it’s visible in code which parameter is being referenced.

```c
CALLINGCONVENTION_API int __stdcall fnCallingConvention(int a, int b)
{
  return (a+1) * (b+2);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  fnCallingConvention(1, 2);
  return TRUE;
}
```

```asm
_DllMain@12:
  100113B7: 6A 02              push        2
  100113B9: 6A 01              push        1
  100113BB: E8 86 FC FF FF     call        _fnCallingConvention@8

_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 8B 4D 0C           mov         ecx,dword ptr [ebp+0Ch]
  10001009: 40                 inc         eax
  1000100A: 83 C1 02           add         ecx,2
  1000100D: 0F AF C1           imul        eax,ecx
  10001010: 5D                 pop         ebp
  10001011: C2 08 00           ret         8
```

Observations:

* Parameters are pushed from right to left (parameter `b==2` is pushed first,
  followed by parameter `a==1`).
* Parameter `a` has an offset of `EBP+8` in the callee.
* Parameter `b` has an offset of `EBP+12` in the callee.
* The result is stored in `EDX:EAX`, but the caller will ignore `EDX`, which
  leaves the lower 32-bit result in `EAX`.
* 8 bytes are pushed on the stack by the caller, 8 bytes are popped by the
  callee.

The stackframe in the callee, based on EBP looks like:

| Offset               | Value                        |
| -------------------- | ---------------------------- |
| `dword ptr [EBP+12]` | Parameter `b`                |
| `dword ptr [EBP+8]`  | Parameter `a`                |
| `dword ptr [EBP+4]`  | Callers `EIP` return address |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer  |
| `xxx ptr [EBP-x]`    | Local stack variables        |

#### Mixed Floats and Integers

A mix of floats and integers are passed to the callee, with an integer being
returned

```c
CALLINGCONVENTION_API int __stdcall fnCallingConvention(float a, int b, float c, int d)
{
  return (a+1) * (b+2) * (c+3) * (d+4);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  return fnCallingConvention(1, 2, 3, 4);
}
```

```asm
_DllMain@12:
  10001050: 6A 04              push        4
  10001052: 51                 push        ecx
  10001053: C7 04 24 00 00 40  mov         dword ptr [esp],40400000h
            40
  1000105A: 6A 02              push        2
  1000105C: 51                 push        ecx
  1000105D: C7 04 24 00 00 80  mov         dword ptr [esp],3F800000h
            3F
  10001064: E8 97 FF FF FF     call        _fnCallingConvention@16

_fnCallingConvention@16:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 0C           mov         eax,dword ptr [ebp+0Ch]
  10001006: F3 0F 10 4D 08     movss       xmm1,dword ptr [ebp+8]
  1000100B: F3 0F 58 0D B8 20  addss       xmm1,dword ptr [__real@3f800000]
            00 10
  10001013: 83 C0 02           add         eax,2
  10001016: 66 0F 6E C0        movd        xmm0,eax
  1000101A: 8B 45 14           mov         eax,dword ptr [ebp+14h]
  1000101D: 0F 5B C0           cvtdq2ps    xmm0,xmm0
  10001020: 83 C0 04           add         eax,4
  10001023: F3 0F 59 C8        mulss       xmm1,xmm0
  10001027: F3 0F 10 45 10     movss       xmm0,dword ptr [ebp+10h]
  1000102C: F3 0F 58 05 BC 20  addss       xmm0,dword ptr [__real@40400000]
            00 10
  10001034: F3 0F 59 C8        mulss       xmm1,xmm0
  10001038: 66 0F 6E C0        movd        xmm0,eax
  1000103C: 0F 5B C0           cvtdq2ps    xmm0,xmm0
  1000103F: F3 0F 59 C8        mulss       xmm1,xmm0
  10001043: F3 0F 2C C1        cvttss2si   eax,xmm1
  10001047: 5D                 pop         ebp
  10001048: C2 10 00           ret         10h
```

Observations:

* Floating point values are pushed on the stack with each taking 4 bytes in the
  same manner as integers. The compiler pushes the binary representation for the
  values 1.0 and 3.0. The register `ECX` is scratch and the instructions `push
  ecx` are equivalent to `sub esp,4` in this case, except the `push` instruction
  is faster.
* The result is stored in `EAX` and is an integer
* 16 bytes are pushed on the stack by the caller, 16 bytes are popped by the
  callee.

The stackframe of the callee, based on `EBP` looks like:

| Offset               | Value                        |
| -------------------- | ---------------------------- |
| `dword ptr [EBP+20]` | Parameter `d`                |
| `dword ptr [EBP+16]` | Parameter `c` (float)        |
| `dword ptr [EBP+12]` | Parameter `b`                |
| `dword ptr [EBP+8]`  | Parameter `a` (float)        |
| `dword ptr [EBP+4]`  | Callers `EIP` return address |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer  |

#### Doubles

Doubles take 64-bits of storage. We'll see that they're no different to floats.
In addition, we'll see that doubles are returned by the FPU stack.

```c
CALLINGCONVENTION_API double __stdcall fnCallingConvention(double x, double y)
{
  return (x + 1) * (y + 2);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  return (int)fnCallingConvention(1, 2);
}
```

```asm
_DllMain@12:
  10001030: 55                 push        ebp
  10001031: 8B EC              mov         ebp,esp
  10001033: 83 EC 08           sub         esp,8
  10001036: F2 0F 10 05 C0 20  movsd       xmm0,mmword ptr [__real@4000000000000000]
            00 10
  1000103E: 83 EC 10           sub         esp,10h
  10001041: F2 0F 11 44 24 08  movsd       mmword ptr [esp+8],xmm0
  10001047: F2 0F 10 05 B8 20  movsd       xmm0,mmword ptr [__real@3ff0000000000000]
            00 10
  1000104F: F2 0F 11 04 24     movsd       mmword ptr [esp],xmm0
  10001054: E8 A7 FF FF FF     call        _fnCallingConvention@16
  10001059: DD 5D F8           fstp        qword ptr [ebp-8]
  1000105C: F2 0F 2C 45 F8     cvttsd2si   eax,mmword ptr [ebp-8]
  10001061: 8B E5              mov         esp,ebp
  10001063: 5D                 pop         ebp
  10001064: C2 0C 00           ret         0Ch

_fnCallingConvention@16:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: F2 0F 10 4D 08     movsd       xmm1,mmword ptr [ebp+8]
  10001008: F2 0F 10 45 10     movsd       xmm0,mmword ptr [ebp+10h]
  1000100D: F2 0F 58 0D B8 20  addsd       xmm1,mmword ptr [__real@3ff0000000000000]
            00 10
  10001015: F2 0F 58 05 C0 20  addsd       xmm0,mmword ptr [__real@4000000000000000]
            00 10
  1000101D: F2 0F 59 C8        mulsd       xmm1,xmm0
  10001021: F2 0F 11 4D 08     movsd       mmword ptr [ebp+8],xmm1
  10001026: DD 45 08           fld         qword ptr [ebp+8]
  10001029: 5D                 pop         ebp
  1000102A: C2 10 00           ret         10h
```

Observations:

* Doubles are still pushed on the stack given by `ESP`, taking 8 bytes each. The
  caller allocates 16 bytes at instruction 1000103E, moving 8-byte values via
  SSE instructions into the reserved space with instructions 10001041 and
  1000104F.
* The return value is given on the FPU stack with the `fld` instruction
* 16 bytes are pushed on the stack by the caller for the parameters, 16 bytes
  are popped by the callee.

The stackframe of the callee, based on `EBP` looks like:

| Offset               | Value                                             |
| -------------------- | ------------------------------------------------- |
| `dword ptr [EBP+16]` | Parameter `b` (double, 8 bytes, 4000000000000000) |
| `dword ptr [EBP+8]`  | Parameter `a` (double, 8 bytes, 3ff0000000000000) |
| `dword ptr [EBP+4]`  | Callers `EIP` return address                      |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer                       |
| `xxx ptr [EBP-x]`    | Local stack variables                             |

#### Floats

Floats are handled the same as doubles, except the size of a float is 32-bit.

```c
CALLINGCONVENTION_API float __stdcall fnCallingConvention(float x, float y)
{
  return (x + 1) * (y + 2);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  return (int)fnCallingConvention(1, 2);
}
```

```asm
_DllMain@12:
  10001030: 55                 push        ebp
  10001031: 8B EC              mov         ebp,esp
  10001033: 51                 push        ecx
  10001034: 83 EC 08           sub         esp,8
  10001037: C7 44 24 04 00 00  mov         dword ptr [esp+4],40000000h
            00 40
  1000103F: C7 04 24 00 00 80  mov         dword ptr [esp],3F800000h
            3F
  10001046: E8 B5 FF FF FF     call        _fnCallingConvention@8
  1000104B: D9 5D FC           fstp        dword ptr [ebp-4]
  1000104E: F3 0F 2C 45 FC     cvttss2si   eax,dword ptr [ebp-4]
  10001053: 8B E5              mov         esp,ebp
  10001055: 5D                 pop         ebp
  10001056: C2 0C 00           ret         0Ch

_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: F3 0F 10 4D 08     movss       xmm1,dword ptr [ebp+8]
  10001008: F3 0F 10 45 0C     movss       xmm0,dword ptr [ebp+0Ch]
  1000100D: F3 0F 58 0D B8 20  addss       xmm1,dword ptr [__real@3f800000]
            00 10
  10001015: F3 0F 58 05 BC 20  addss       xmm0,dword ptr [__real@40000000]
            00 10
  1000101D: F3 0F 59 C8        mulss       xmm1,xmm0
  10001021: F3 0F 11 4D 08     movss       dword ptr [ebp+8],xmm1
  10001026: D9 45 08           fld         dword ptr [ebp+8]
  10001029: 5D                 pop         ebp
  1000102A: C2 08 00           ret         8
```

Observations:

* Floats are pushed on the stack given by `ESP`.
* The return value is given on the FPU stack with the `fld` instruction
* 8 bytes are pushed on the stack by the caller for the parameters, 8 bytes are
  popped by the callee.

The stackframe of the callee, based on `EBP` looks like:

| Offset               | Value                                    |
| -------------------- | ---------------------------------------- |
| `dword ptr [EBP+12]` | Parameter `b` (float, 4 bytes, 40000000) |
| `dword ptr [EBP+8]`  | Parameter `a` (float, 4 bytes, 3f800000) |
| `dword ptr [EBP+4]`  | Callers `EIP` return address             |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer              |
| `xxx ptr [EBP-x]`    | Local stack variables                    |

##### Without SSE instructions

The above example uses SSE instructions. The same is performed with basic ia32
instructions with the option `/arch:ia32`.

```asm
_DllMain@12:
  10001030: D9 05 D8 20 00 10  fld         dword ptr [__real@40000000]
  10001036: 83 EC 08           sub         esp,8
  10001039: D9 5C 24 04        fstp        dword ptr [esp+4]
  1000103D: D9 E8              fld1
  1000103F: D9 1C 24           fstp        dword ptr [esp]
  10001042: E8 B9 FF FF FF     call        _fnCallingConvention@8
  10001047: E8 04 00 00 00     call        __ftol2_sse
  1000104C: C2 0C 00           ret         0Ch

_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: D9 45 08           fld         dword ptr [ebp+8]
  10001006: DC 05 C8 20 00 10  fadd        qword ptr [__real@3ff0000000000000]
  1000100C: D9 45 0C           fld         dword ptr [ebp+0Ch]
  1000100F: DC 05 D0 20 00 10  fadd        qword ptr [__real@4000000000000000]
  10001015: DE C9              fmulp       st(1),st
  10001017: D9 5D 08           fstp        dword ptr [ebp+8]
  1000101A: D9 45 08           fld         dword ptr [ebp+8]
  1000101D: 5D                 pop         ebp
  1000101E: C2 08 00           ret         8
```

The function is equivalent to the SSE version. It stores the result on the FPU
stack. Parameters are obtained relative to the CPU's `EBP` Stack Frame pointer.

#### Structs by Value

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

CALLINGCONVENTION_API int __stdcall fnCallingConvention(struct mystruct *ps, struct mystruct s)
{
  return ps->a + s.a;
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  struct mystruct x = {0, };
  struct mystruct y = {0, };

  return fnCallingConvention(&x, y);
}
```

```asm
_DllMain@12:
  10001010: 55                 push        ebp
  10001011: 8B EC              mov         ebp,esp
  10001013: 83 EC 34           sub         esp,34h
  10001016: A1 00 30 00 10     mov         eax,dword ptr [___security_cookie]
  1000101B: 33 C5              xor         eax,ebp
  1000101D: 89 45 FC           mov         dword ptr [ebp-4],eax
  10001020: 0F 57 C0           xorps       xmm0,xmm0
  10001023: 83 EC 18           sub         esp,18h
  10001026: 8B C4              mov         eax,esp
  10001028: 66 0F D6 45 E8     movq        mmword ptr [ebp-18h],xmm0
  1000102D: 66 0F D6 45 F0     movq        mmword ptr [ebp-10h],xmm0
  10001032: 66 0F D6 45 D0     movq        mmword ptr [ebp-30h],xmm0
  10001037: 66 0F D6 45 D8     movq        mmword ptr [ebp-28h],xmm0
  1000103C: C7 45 CC 00 00 00  mov         dword ptr [ebp-34h],0
            00
  10001043: F3 0F 7E 45 CC     movq        xmm0,mmword ptr [ebp-34h]
  10001048: 66 0F D6 00        movq        mmword ptr [eax],xmm0
  1000104C: F3 0F 7E 45 D4     movq        xmm0,mmword ptr [ebp-2Ch]
  10001051: 66 0F D6 40 08     movq        mmword ptr [eax+8],xmm0
  10001056: C7 45 E0 00 00 00  mov         dword ptr [ebp-20h],0
            00
  1000105D: F3 0F 7E 45 DC     movq        xmm0,mmword ptr [ebp-24h]
  10001062: 66 0F D6 40 10     movq        mmword ptr [eax+10h],xmm0
  10001067: 8D 45 E4           lea         eax,[ebp-1Ch]
  1000106A: 50                 push        eax
  1000106B: C7 45 E4 00 00 00  mov         dword ptr [ebp-1Ch],0
            00
  10001072: C7 45 F8 00 00 00  mov         dword ptr [ebp-8],0
            00
  10001079: E8 82 FF FF FF     call        _fnCallingConvention@28
  1000107E: 8B 4D FC           mov         ecx,dword ptr [ebp-4]
  10001081: 33 CD              xor         ecx,ebp
  10001083: E8 06 00 00 00     call        @__security_check_cookie@4
  10001088: 8B E5              mov         esp,ebp
  1000108A: 5D                 pop         ebp
  1000108B: C2 0C 00           ret         0Ch

_fnCallingConvention@28:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 8B 00              mov         eax,dword ptr [eax]
  10001008: 03 45 0C           add         eax,dword ptr [ebp+0Ch]
  1000100B: 5D                 pop         ebp
  1000100C: C2 1C 00           ret         1Ch
```

Observations:

* The parameter size is 4 bytes for a pointer plus 6*4 (24) bytes for the struct
  being passed by value. This results in 28 bytes via the parameter list, hence
  the name `_fnCallingConvention@28`.
* Space is allocated on the stack for `x` and `y` by the caller. Additional
  space is allocated for a copy of `y`. The contents of `y` is copied to the
  stack, which is then passed by value.

The stackframe of the callee, based on `EBP` looks like:

| Offset               | Value                                                               |
| -------------------- | ------------------------------------------------------------------- |
| `dword ptr [EBP+60]` | The callers copy of `x`, the address stored in `dword ptr [EBP+8]`. |
| `dword ptr [EBP+36]` | The callers copy of `y` which is 24 bytes                           |
| `dword ptr [EBP+12]` | 24 bytes which is a copy of `y` on the stack                        |
| `dword ptr [EBP+8]`  | A pointer to `x` from the callers stack                             |
| `dword ptr [EBP+4]`  | Callers `EIP` return address                                        |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer                                         |
| `xxx ptr [EBP-x]`    | Local stack variables                                               |

We see that passing a struct by value makes a copy of that struct and pushes it
on the stack, making this type of call inefficient. Much better would be to pass
the struct by reference, eliminating the copying.

#### 64-bit return value

Return values that are 64-bit long are returned via registers.

```c
CALLINGCONVENTION_API LONG64 __stdcall fnCallingConvention(LONG x, LONG y)
{
  return (LONG64)(x + 1) * (LONG64)(y + 2);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  return fnCallingConvention(1, 2);
}
```

```asm
_DllMain@12:
  10001020: 6A 02              push        2
  10001022: 6A 01              push        1
  10001024: E8 D7 FF FF FF     call        _fnCallingConvention@8
  10001029: C2 0C 00           ret         0Ch

_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 8B 4D 0C           mov         ecx,dword ptr [ebp+0Ch]
  10001009: 40                 inc         eax
  1000100A: 83 C1 02           add         ecx,2
  1000100D: F7 E9              imul        ecx
  1000100F: 5D                 pop         ebp
  10001010: C2 08 00           ret         8
```

Observations:

* The result of the multiplication `imul` is stored in `EDX:EAX`, `EDX` is the
  upper 32-bits, `EAX` is the lower 32-bits. This is also returned to the
  caller.
* The code is so written with type casting that the smallest number of
  instructions are generated.

The stackframe in the callee, based on `EBP` looks like:

| Offset               | Value                        |
| -------------------- | ---------------------------- |
| `dword ptr [EBP+12]` | Parameter `y`                |
| `dword ptr [EBP+8]`  | Parameter `x`                |
| `dword ptr [EBP+4]`  | Callers `EIP` return address |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer  |
| `xxx ptr [EBP-x]`    | Local stack variables        |

##### Typecasting for a correct program

The example previously puts typecasting in a position so to produce the minimal
amount of code. But it introduces a subtle error that can occur if the parameter
`x` is the largest possible signed number 2^31-1 or `y` is so large that
rollover can occur 2^31-2. The result will be 64-bit but will be truncated at
32-bit. The following code examples solve this problem, but show many more
instructions are required.

```c
CALLINGCONVENTION_API LONG64 __stdcall fnCallingConvention(LONG x, LONG y)
{
  return ((LONG64)x + 1) * ((LONG64)y + 2);
}
```

```asm
_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 99                 cdq
  10001007: 56                 push        esi
  10001008: 8B F0              mov         esi,eax
  1000100A: 8B 45 0C           mov         eax,dword ptr [ebp+0Ch]
  1000100D: 8B CA              mov         ecx,edx
  1000100F: 83 C6 01           add         esi,1
  10001012: 99                 cdq
  10001013: 83 D1 00           adc         ecx,0
  10001016: 83 C0 02           add         eax,2
  10001019: 83 D2 00           adc         edx,0
  1000101C: 52                 push        edx
  1000101D: 50                 push        eax
  1000101E: 51                 push        ecx
  1000101F: 56                 push        esi
  10001020: E8 1B 00 00 00     call        __allmul
  10001025: 5E                 pop         esi
  10001026: 5D                 pop         ebp
  10001027: C2 08 00           ret         8
```

We see that the parameters are first extended to 64-bit and then multiplied.

##### No Typecasting

Similar code is produced with no typecasting, except the result is reduced to
32-bit by clearing the `EDX` register with a `cdq` assembler instruction.

```c
CALLINGCONVENTION_API LONG64 __stdcall fnCallingConvention(LONG x, LONG y)
{
  return (x + 1) * (y + 2);
}
```

```asm
_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 8B 4D 0C           mov         ecx,dword ptr [ebp+0Ch]
  10001009: 40                 inc         eax
  1000100A: 83 C1 02           add         ecx,2
  1000100D: 0F AF C1           imul        eax,ecx
  10001010: 99                 cdq
  10001011: 5D                 pop         ebp
  10001012: C2 08 00           ret         8
```

#### Return Struct by Value

The final example shows how a `struct` is returned by value.

```c
struct mystruct {
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
};

CALLINGCONVENTION_API struct mystruct __stdcall fnCallingConvention(int x, int y)
{
  struct mystruct t = {0, };
  t.a = x;
  t.b = y;
  return t;
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  struct mystruct x;
  x = fnCallingConvention(1, 2);
  return x.a;
}
```

```asm
_DllMain@12:
  10001030: 55                 push        ebp
  10001031: 8B EC              mov         ebp,esp
  10001033: 83 EC 30           sub         esp,30h
  10001036: 6A 02              push        2
  10001038: 6A 01              push        1
  1000103A: 8D 45 D0           lea         eax,[ebp-30h]
  1000103D: 50                 push        eax
  1000103E: E8 BD FF FF FF     call        _fnCallingConvention@8
  10001043: F3 0F 7E 00        movq        xmm0,mmword ptr [eax]
  10001047: 66 0F D6 45 E8     movq        mmword ptr [ebp-18h],xmm0
  1000104C: F3 0F 7E 40 08     movq        xmm0,mmword ptr [eax+8]
  10001051: 66 0F D6 45 F0     movq        mmword ptr [ebp-10h],xmm0
  10001056: F3 0F 7E 40 10     movq        xmm0,mmword ptr [eax+10h]
  1000105B: 8B 45 E8           mov         eax,dword ptr [ebp-18h]
  1000105E: 66 0F D6 45 F8     movq        mmword ptr [ebp-8],xmm0
  10001063: 8B E5              mov         esp,ebp
  10001065: 5D                 pop         ebp
  10001066: C2 0C 00           ret         0Ch

_fnCallingConvention@8:
  10001000: 55                 push        ebp
  10001001: 8B EC              mov         ebp,esp
  10001003: 8B 45 08           mov         eax,dword ptr [ebp+8]
  10001006: 8B 4D 0C           mov         ecx,dword ptr [ebp+0Ch]
  10001009: 0F 57 C0           xorps       xmm0,xmm0
  1000100C: 66 0F D6 40 04     movq        mmword ptr [eax+4],xmm0
  10001011: 66 0F D6 40 0C     movq        mmword ptr [eax+0Ch],xmm0
  10001016: C7 40 14 00 00 00  mov         dword ptr [eax+14h],0
            00
  1000101D: 89 08              mov         dword ptr [eax],ecx
  1000101F: 8B 4D 10           mov         ecx,dword ptr [ebp+10h]
  10001022: 89 48 04           mov         dword ptr [eax+4],ecx
  10001025: 5D                 pop         ebp
  10001026: C2 0C 00           ret         0Ch
```

Observations:

* There is an extra parameter passed on the stack from the caller to the callee,
  a pointer to the struct allocated on the stack by the caller.
* The return struct pointer is passed as though it's the first parameter.
* The name of the callee indicates 8 bytes in the parameter list with
  `_fnCallingConvention@8`, even though 12 bytes are given in the stack. This
  shows the calling convention is based on the function signature, the return
  value doesn't form part of the function signature.
* The callee pops 12 bytes from the stack, consistent with the three parameters.
* The callee doesn't allocate space on its stack for the return value, but the
  caller does (and it's responsible for the return value).
* On return, the register `EAX` contains the pointer to the return struct
  allocated by the caller.

The stackframe of the callee, based on `EBP` looks like:

| Offset               | Value                        |
| -------------------- | ---------------------------- |
| `dword ptr [EBP+20]` | return struct                |
| `dword ptr [EBP+16]` | Parameter `y`                |
| `dword ptr [EBP+12]` | Parameter `x`                |
| `dword ptr [EBP+8]`  | Pointer to return struct     |
| `dword ptr [EBP+4]`  | Callers `EIP` return address |
| `dword ptr [EBP]`    | Callers `EBP` frame pointer  |
| `xxx ptr [EBP-x]`    | Local stack variables        |

Note that the callee doesn't necessary know the return struct is at the offset
`[EBP+20]`, instead it should use the pointer given at `[EBP+8]`.
