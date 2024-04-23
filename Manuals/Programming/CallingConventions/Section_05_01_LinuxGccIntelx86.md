## GCC: 32-bit Sys V ABI on Intel

The Linux ABI for Intel computers (e.g. your laptop running Linux) for user
space programs is based on the System V Application Binary Interface.

The code examples are created using GCC compiled with no optimisations (`-O0`)
option. The functions being called are deliberately placed in one c-module,
while the functions that are created for testing are placed in a separate
module. This prevents the compiler from providing other optimisations.

Disassembly is done using GNU binutils, particularly the `objdump` command with
output formatted in the Intel format (to provide consistency with Windows; the
default is AT&T).

### Naming Convention

The names of functions when calling using `extern "C"` are as is. There is no
underscore prepended or other characters added.

### Parameter Passing and Return Values

The System V ABI specifies sizes for types (BYTE is 8 byte; WORD is 16-bit;
DWORD is 32-bit) as in the following table. The size of these types affect the
amount of space required on the stack when transferring parameters to functions.

| Type           | C                    | sizeof | alignment | i386 Arch          |
| -------------- | -------------------- | ------ | --------- | ------------------ |
| Integral       | char / signed char   | 1      | 1         | signed byte        |
|                | unsigned char        | 1      | 1         | unsigned byte      |
|                | short / signed short | 2      | 2         | signed word        |
|                | unsigned short       | 2      | 2         | unsigned word      |
|                | int / signed int     | 4      | 4         | signed dword       |
|                | long / signed long   | 4      | 4         | signed dword       |
|                | unsigned int         | 4      | 4         | unsigned dword     |
|                | unsigned long        | 4      | 4         | unsigned dword     |
| Pointer        | variable *           | 4      | 4         | unsigned dword     |
|                | function *           | 4      | 4         | unsigned dword     |
| Floating Point | float                | 4      | 4         | single precision   |
|                | double               | 8      | 4         | double precision   |
|                | long double          | 12     | 4         | extended precision |

Arguments are passed on the main stack (given by the register `ESP`):

* Arguments are pushed on the stack right to left. That is, the last argument is
  pushed first so it has the highest address.
* Arguments are pushed on the stack as 32-bit values. This is important for
  `char` and `short` values, it will be expanded to 16-bits.

Return values on exit (64-bit or less) are given in registers.

* Values fitting within 32-bits are given in `EAX`.
* Values requiring 64-bits are given in `EDX` in the upper 32-bits, `EAX` in the
  lower 32-bits.
* Floating point results are given in the floating point register `ST(0)`. The
  caller shall remove the value from the stack even if it doesn't use it.

Return structs by value that are greater than 64-bits are handled as follows:

* Structures which are returned by value are allocated by the caller (where it's
  allocated is not defined, but this is generally on the stack).
* A pointer to the return struct is then given to the caller as a pointer, as if
  this was the first argument.
* On return, the callee places the pointer to this structure in the return
  register `EAX`. The reason why the caller allocates this space is clarified by
  the System V ABI - it allows for re-entrancy.
* Variable sized structures as return values is undefined.
* The called function must remove the function from the stack before returning.
  This is a special case where the callee must perform specific cleanup of the
  stack.

### Scratch Registers

The following registers are considered scratch registers, the callee doesn't
need to preserve their values before and after the function call.

* `EAX` contains the result of the function call
* `ECX` and `EDX`
* FPU register `ST(0)` must be empty on entry (the FPU stack is empty). On exit
  contains the result for functions that return a float.
* `EFLAGS` don't need to be preserve specific bit fields, but the caller needs
  to ensure that the direction flag is forward

The other registers must be preserved, e.g. `EBP`, `EBX`, `EDI`, `ESI` and
`ESP`. The System V ABI describes some detail as to why these registers must be
preserved:

* The `EBP` holds the base frame for the current stack frame, sometimes called
  the frame-pointer. It's generally noted that some debuggers rely on a valid
  `EBP` to provide debugging information for the current function. The callee
  would set up it's own stack frame, but on return it must be reset to the
  caller's frame-pointer.
* The `EBX` serves as the global offset table base register for position
  independent code.

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
00000000 <test_funcintr>:
   0:   55                      push   ebp
   1:   89 e5                   mov    ebp,esp
   3:   83 ec 18                sub    esp,0x18
   6:   e8 fc ff ff ff          call   7 <test_funcintr+0x7>
   b:   83 c0 01                add    eax,0x1
   e:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
  11:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
  14:   c9                      leave
  15:   c3                      ret

00000000 <funcintr>:
   0:   55                      push   ebp
   1:   89 e5                   mov    ebp,esp
   3:   b8 2a 00 00 00          mov    eax,0x2a
   8:   5d                      pop    ebp
   9:   c3                      ret
```

Observations

* The result is placed in the register `EAX`
* The caller has allocated 24-bytes stack for itself. Although it's not really
  needed, the compiler has all optimisations turned off so it performs some
  useless instructions such as copying the result to a variable on the stack,
  then copying it back to the register for the return value.

The callee doesn't have any parameters and doesn't use the stack except to store
the stack frame pointer, so we don't describe the stack frame here.

#### 64-bit Integer Return Value

##### 64-bit return in full 64-bits

Here we show the code for the case of a 64-bit return value, where the upper
64-bits are defined.

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
00000016 <test_funcint64r>:
  16:   55                      push   ebp
  17:   89 e5                   mov    ebp,esp
  19:   83 ec 18                sub    esp,0x18
  1c:   e8 fc ff ff ff          call   1d <test_funcint64r+0x7>
  21:   83 c0 01                add    eax,0x1
  24:   83 d2 00                adc    edx,0x0
  27:   89 45 f0                mov    DWORD PTR [ebp-0x10],eax
  2a:   89 55 f4                mov    DWORD PTR [ebp-0xc],edx
  2d:   8b 45 f0                mov    eax,DWORD PTR [ebp-0x10]
  30:   c9                      leave
  31:   c3                      ret

0000000a <funcint64r>:
   a:   55                      push   ebp
   b:   89 e5                   mov    ebp,esp
   d:   b8 00 00 00 00          mov    eax,0x0
  12:   ba 42 00 00 00          mov    edx,0x42
  17:   5d                      pop    ebp
  18:   c3                      ret
```

Observations

* The callee stores the upper 32-bits in `EDX` and the lower 32-bits in `EAX`,
  commonly also described as `EDX:EAX` being the return value.
* Adding the value 1 to the result requires two instructions for 64-bit (the
  second is `adc` or add with carry).

##### 64-bit Return Needing only 32-bits

Even if the result fits within 32-bits, the compiler correctly clears the upper
32-bits.

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
00000032 <test_funcint64r2>:
  32:   55                      push   ebp
  33:   89 e5                   mov    ebp,esp
  35:   83 ec 18                sub    esp,0x18
  38:   e8 fc ff ff ff          call   39 <test_funcint64r2+0x7>
  3d:   83 c0 01                add    eax,0x1
  40:   83 d2 00                adc    edx,0x0
  43:   89 45 f0                mov    DWORD PTR [ebp-0x10],eax
  46:   89 55 f4                mov    DWORD PTR [ebp-0xc],edx
  49:   8b 45 f0                mov    eax,DWORD PTR [ebp-0x10]
  4c:   c9                      leave
  4d:   c3                      ret

00000019 <funcint64r2>:
  19:   55                      push   ebp
  1a:   89 e5                   mov    ebp,esp
  1c:   b8 2a 00 00 00          mov    eax,0x2a
  21:   ba 00 00 00 00          mov    edx,0x0
  26:   5d                      pop    ebp
  27:   c3                     ret
```

Observations

* The callee stores the upper 32-bits in `EDX` and the lower 32-bits in `EAX`.
  Even though the upper 32-bits are zero, this is still correctly cleared.
* Adding the value 1 to the result requires two instructions for 64-bit (the
  second is `adc` or add with carry).

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
0000004e <test_funcint>:
  4e:   55                      push   ebp
  4f:   89 e5                   mov    ebp,esp
  51:   83 ec 28                sub    esp,0x28
  54:   c7 44 24 08 03 00 00    mov    DWORD PTR [esp+0x8],0x3
  5b:   00
  5c:   c7 44 24 04 02 00 00    mov    DWORD PTR [esp+0x4],0x2
  63:   00
  64:   c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
  6b:   e8 fc ff ff ff          call   6c <test_funcint+0x1e>
  70:   83 c0 01                add    eax,0x1
  73:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
  76:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
  79:   c9                      leave
  7a:   c3                      ret

00000028 <funcint>:
  28:   55                      push   ebp
  29:   89 e5                   mov    ebp,esp
  2b:   8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
  2e:   8d 50 01                lea    edx,[eax+0x1]
  31:   8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
  34:   83 c0 02                add    eax,0x2
  37:   0f af c2                imul   eax,edx
  3a:   8b 55 10                mov    edx,DWORD PTR [ebp+0x10]
  3d:   83 c2 03                add    edx,0x3
  40:   0f af c2                imul   eax,edx
  43:   5d                      pop    ebp
  44:   c3                      ret
```

Observations

* The GCC compiler prefers to allocate space on the stack and then move the
  values onto the stack, instead of pushing the parameters.
* The first parameter has the highest address (see stack frame below)

The stack in the caller, based on `EBP` of the callee `funcint` looks like

| Offset               | Value                                           |
| -------------------- | ----------------------------------------------- |
| `dword ptr [EBP+48]` | `EBP`                                           |
| `dword ptr [EBP+44]` |                                                 |
| `dword ptr [EBP+40]` |                                                 |
| `dword ptr [EBP+36]` | `test_funcint` local stack, `int a`             |
| `dword ptr [EBP+32]` |                                                 |
| `dword ptr [EBP+28]` |                                                 |
| `dword ptr [EBP+24]` |                                                 |
| `dword ptr [EBP+20]` |                                                 |
| `dword ptr [EBP+16]` | `funcint` Parameter 3, `int c`                  |
| `dword ptr [EBP+12]` | `funcint` Parameter 2, `int b`                  |
| `dword ptr [EBP+8]`  | `funcint` Parameter 1, `int a`                  |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0x70`            |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcint` |

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
0000007b <test_funcchar>:
  7b:   55                      push   ebp
  7c:   89 e5                   mov    ebp,esp
  7e:   83 ec 28                sub    esp,0x28
  81:   c7 44 24 04 02 00 00    mov    DWORD PTR [esp+0x4],0x2
  88:   00
  89:   c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
  90:   e8 fc ff ff ff          call   91 <test_funcchar+0x16>
  95:   83 c0 01                add    eax,0x1
  98:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
  9b:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
  9e:   c9                      leave
  9f:   c3                      ret

00000045 <funcchar>:
  45:   55                      push   ebp
  46:   89 e5                   mov    ebp,esp
  48:   83 ec 08                sub    esp,0x8
  4b:   8b 55 08                mov    edx,DWORD PTR [ebp+0x8]
  4e:   8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
  51:   88 55 fc                mov    BYTE PTR [ebp-0x4],dl
  54:   88 45 f8                mov    BYTE PTR [ebp-0x8],al
  57:   0f be 45 fc             movsx  eax,BYTE PTR [ebp-0x4]
  5b:   8d 50 01                lea    edx,[eax+0x1]
  5e:   0f be 45 f8             movsx  eax,BYTE PTR [ebp-0x8]
  62:   83 c0 02                add    eax,0x2
  65:   0f af c2                imul   eax,edx
  68:   c9                      leave
  69:   c3                      ret
```

Observations

* Even though a `char` requires only one byte, 4 bytes are allocated on the
  stack. The values on the stack have the upper bits cleared.
* The callee allocates two virtual char integers on its stack (each aligned to
  32-bits) for the type conversion.
* The result is in `EDX:EAX` from the `imul` instruction, but `EDX` is
  effectively scratch as the caller shouldn't use it (according to the
  signature, the return value is 32-bit, so `EDX` is assumed to be any value).
* The `leave` instruction restores the register `EBP` and `ESP`

Without the `leave` instruction, code such as the following would be required
instead:

```asm
  68:                           add    esp,0x8      ; or   mov esp,ebp
                                pop    ebp
                                ret
```

The stack in the caller, based on `EBP` of the callee `funcchar` looks like

| Offset               | Value                                            |
| -------------------- | ------------------------------------------------ |
| `dword ptr [EBP+48]` | `EBP`                                            |
| `dword ptr [EBP+44]` |                                                  |
| `dword ptr [EBP+40]` |                                                  |
| `dword ptr [EBP+36]` | `test_funcchar` local stack, `int a`             |
| `dword ptr [EBP+32]` |                                                  |
| `dword ptr [EBP+28]` |                                                  |
| `dword ptr [EBP+24]` |                                                  |
| `dword ptr [EBP+20]` |                                                  |
| `dword ptr [EBP+16]` |                                                  |
| `dword ptr [EBP+12]` | `funcchar` Parameter 2, `char b`                 |
| `dword ptr [EBP+8]`  | `funcchar` Parameter 1, `char a`                 |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0x95`             |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcchar` |
| `dword ptr [EBP-4]`  | Temp variable `(char)a`                          |
| `dword ptr [EBP-8]`  | Temp variable `(char)b`                          |

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
000000a0 <test_funcfloat>:
  a0:   55                      push   ebp
  a1:   89 e5                   mov    ebp,esp
  a3:   83 ec 38                sub    esp,0x38
  a6:   b8 00 00 40 40          mov    eax,0x40400000
  ab:   89 44 24 08             mov    DWORD PTR [esp+0x8],eax
  af:   b8 00 00 00 40          mov    eax,0x40000000
  b4:   89 44 24 04             mov    DWORD PTR [esp+0x4],eax
  b8:   b8 00 00 80 3f          mov    eax,0x3f800000
  bd:   89 04 24                mov    DWORD PTR [esp],eax
  c0:   e8 fc ff ff ff          call   c1 <test_funcfloat+0x21>
  c5:   d9 05 00 00 00 00       fld    DWORD PTR ds:0x0
  cb:   de c1                   faddp  st(1),st
  cd:   d9 5d f4                fstp   DWORD PTR [ebp-0xc]
  d0:   d9 45 f4                fld    DWORD PTR [ebp-0xc]
  d3:   d9 7d e6                fnstcw WORD PTR [ebp-0x1a]
  d6:   0f b7 45 e6             movzx  eax,WORD PTR [ebp-0x1a]
  da:   b4 0c                   mov    ah,0xc
  dc:   66 89 45 e4             mov    WORD PTR [ebp-0x1c],ax
  e0:   d9 6d e4                fldcw  WORD PTR [ebp-0x1c]
  e3:   db 5d e0                fistp  DWORD PTR [ebp-0x20]
  e6:   d9 6d e6                fldcw  WORD PTR [ebp-0x1a]
  e9:   8b 45 e0                mov    eax,DWORD PTR [ebp-0x20]
  ec:   c9                      leave
  ed:   c3                      ret

Contents of section .rodata:
 0000 00000000 00000040 00000000 00000840  .......@.......@
 0010 00000000 00001040                    .......@

0000006a <funcfloat>:
  6a:   55                      push   ebp
  6b:   89 e5                   mov    ebp,esp
  6d:   83 ec 08                sub    esp,0x8
  70:   d9 45 08                fld    DWORD PTR [ebp+0x8]
  73:   d9 e8                   fld1
  75:   de c1                   faddp  st(1),st
  77:   d9 45 0c                fld    DWORD PTR [ebp+0xc]
  7a:   dd 05 00 00 00 00       fld    QWORD PTR ds:0x0
  80:   de c1                   faddp  st(1),st
  82:   de c9                   fmulp  st(1),st
  84:   d9 45 10                fld    DWORD PTR [ebp+0x10]
  87:   dd 05 08 00 00 00       fld    QWORD PTR ds:0x8
  8d:   de c1                   faddp  st(1),st
  8f:   de c9                   fmulp  st(1),st
  91:   d9 5d fc                fstp   DWORD PTR [ebp-0x4]
  94:   d9 45 fc                fld    DWORD PTR [ebp-0x4]
  97:   c9                      leave
  98:   c3                      ret
```

Observations

* Floats are copied onto the stack, taking 4-bytes, as like integers.
* The result is provided in `ST(0)`, the first element on the FPU stack
* Line `7a` loads the value `0x40000000 00000000` which is double precision for
  2.0
* Line `87` loads the value `0x84000000 00000000` which is double precision for
  3.0
* The logic reading the FPU control word temporarily masks out the Overflow (bit
  3) and Zero Divide (bit 2) exceptions. See the Intel FPU Manual.

The stack in the caller, based on `EBP` of the callee `funcfloat` looks like

| Offset               | Value                                             |
| -------------------- | ------------------------------------------------- |
| `dword ptr [EBP+64]` | EBP                                               |
| `dword ptr [EBP+60]` |                                                   |
| `dword ptr [EBP+56]` |                                                   |
| `dword ptr [EBP+52]` | result from funcfloat + 4.0                       |
| `dword ptr [EBP+48]` |                                                   |
| `dword ptr [EBP+44]` |                                                   |
| `dword ptr [EBP+40]` |                                                   |
| `dword ptr [EBP+36]` | addr EBP+38 = FPU control word                    |
| `dword ptr [EBP+32]` | Integer result                                    |
| `dword ptr [EBP+28]` |                                                   |
| `dword ptr [EBP+24]` |                                                   |
| `dword ptr [EBP+20]` |                                                   |
| `dword ptr [EBP+16]` | `funcfloat` Parameter 3, `float c`                |
| `dword ptr [EBP+12]` | `funcfloat` Parameter 2, `float b`                |
| `dword ptr [EBP+8]`  | `funcfloat` Parameter 1, `float a`                |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0xC5`              |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcfloat` |
| `dword ptr [EBP-4]`  | Local stack `float a`                             |
| `dword ptr [EBP-8]`  |                                                   |

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
000000ee <test_funcfloatint>:
  ee:   55                      push   ebp
  ef:   89 e5                   mov    ebp,esp
  f1:   83 ec 28                sub    esp,0x28
  f4:   b8 00 00 80 40          mov    eax,0x40800000
  f9:   89 44 24 0c             mov    DWORD PTR [esp+0xc],eax
  fd:   c7 44 24 08 03 00 00    mov    DWORD PTR [esp+0x8],0x3
 104:   00
 105:   b8 00 00 00 40          mov    eax,0x40000000
 10a:   89 44 24 04             mov    DWORD PTR [esp+0x4],eax
 10e:   c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
 115:   e8 fc ff ff ff          call   116 <test_funcfloatint+0x28>
 11a:   83 c0 01                add    eax,0x1
 11d:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 120:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 123:   c9                      leave
 124:   c3                      ret

00000099 <funcfloatint>:
  99:   55                      push   ebp
  9a:   89 e5                   mov    ebp,esp
  9c:   83 ec 08                sub    esp,0x8
  9f:   8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
  a2:   83 c0 01                add    eax,0x1
  a5:   89 45 fc                mov    DWORD PTR [ebp-0x4],eax
  a8:   db 45 fc                fild   DWORD PTR [ebp-0x4]
  ab:   d9 45 0c                fld    DWORD PTR [ebp+0xc]
  ae:   dd 05 00 00 00 00       fld    QWORD PTR ds:0x0
  b4:   de c1                   faddp  st(1),st
  b6:   de c9                   fmulp  st(1),st
  b8:   8b 45 10                mov    eax,DWORD PTR [ebp+0x10]
  bb:   83 c0 03                add    eax,0x3
  be:   89 45 fc                mov    DWORD PTR [ebp-0x4],eax
  c1:   db 45 fc                fild   DWORD PTR [ebp-0x4]
  c4:   de c9                   fmulp  st(1),st
  c6:   d9 45 14                fld    DWORD PTR [ebp+0x14]
  c9:   dd 05 10 00 00 00       fld    QWORD PTR ds:0x10
  cf:   de c1                   faddp  st(1),st
  d1:   de c9                   fmulp  st(1),st
  d3:   d9 7d fa                fnstcw WORD PTR [ebp-0x6]
  d6:   0f b7 45 fa             movzx  eax,WORD PTR [ebp-0x6]
  da:   b4 0c                   mov    ah,0xc
  dc:   66 89 45 f8             mov    WORD PTR [ebp-0x8],ax
  e0:   d9 6d f8                fldcw  WORD PTR [ebp-0x8]
  e3:   db 5d fc                fistp  DWORD PTR [ebp-0x4]
  e6:   d9 6d fa                fldcw  WORD PTR [ebp-0x6]
  e9:   8b 45 fc                mov    eax,DWORD PTR [ebp-0x4]
  ec:   c9                      leave
  ed:   c3                      ret
```

Observations

* A mix of floats and integers are both pushed onto the stack as 32-bit values
* The logic reading the FPU control word temporarily masks out the Overflow (bit
  3) and Zero Divide (bit 2) exceptions. See the Intel FPU Manual.

| Offset               | Value                                                |
| -------------------- | ---------------------------------------------------- |
| `dword ptr [EBP+48]` | EBP                                                  |
| `dword ptr [EBP+44]` |                                                      |
| `dword ptr [EBP+40]` |                                                      |
| `dword ptr [EBP+36]` | Result `int a`                                       |
| `dword ptr [EBP+32]` |                                                      |
| `dword ptr [EBP+28]` |                                                      |
| `dword ptr [EBP+24]` |                                                      |
| `dword ptr [EBP+20]` | `funcfloatint` Parameter 4, `float d = 4.0`          |
| `dword ptr [EBP+16]` | `funcfloatint` Parameter 3, `int c = 3`              |
| `dword ptr [EBP+12]` | `funcfloatint` Parameter 2, `float b = 2.0`          |
| `dword ptr [EBP+8]`  | `funcfloatint` Parameter 1, `int a = 1`              |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0x11A`                |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcfloatint` |
| `dword ptr [EBP-4]`  | Local stack `a + 1`, then `c + 3`                    |
| `dword ptr [EBP-8]`  | addr `EBP-6` = FPU control word                      |

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
00000125 <test_funcdouble>:
 125:   55                      push   ebp
 126:   89 e5                   mov    ebp,esp
 128:   83 ec 38                sub    esp,0x38
 12b:   dd 05 08 00 00 00       fld    QWORD PTR ds:0x8
 131:   dd 5c 24 08             fstp   QWORD PTR [esp+0x8]
 135:   dd 05 10 00 00 00       fld    QWORD PTR ds:0x10
 13b:   dd 1c 24                fstp   QWORD PTR [esp]
 13e:   e8 fc ff ff ff          call   13f <test_funcdouble+0x1a>
 143:   d9 e8                   fld1
 145:   de c1                   faddp  st(1),st
 147:   dd 5d f0                fstp   QWORD PTR [ebp-0x10]
 14a:   dd 45 f0                fld    QWORD PTR [ebp-0x10]
 14d:   d9 7d e6                fnstcw WORD PTR [ebp-0x1a]
 150:   0f b7 45 e6             movzx  eax,WORD PTR [ebp-0x1a]
 154:   b4 0c                   mov    ah,0xc
 156:   66 89 45 e4             mov    WORD PTR [ebp-0x1c],ax
 15a:   d9 6d e4                fldcw  WORD PTR [ebp-0x1c]
 15d:   db 5d e0                fistp  DWORD PTR [ebp-0x20]
 160:   d9 6d e6                fldcw  WORD PTR [ebp-0x1a]
 163:   8b 45 e0                mov    eax,DWORD PTR [ebp-0x20]
 166:   c9                      leave
 167:   c3                      ret

000000ee <funcdouble>:
  ee:   55                      push   ebp
  ef:   89 e5                   mov    ebp,esp
  f1:   83 ec 10                sub    esp,0x10
  f4:   8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
  f7:   89 45 f8                mov    DWORD PTR [ebp-0x8],eax
  fa:   8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
  fd:   89 45 fc                mov    DWORD PTR [ebp-0x4],eax
 100:   8b 45 10                mov    eax,DWORD PTR [ebp+0x10]
 103:   89 45 f0                mov    DWORD PTR [ebp-0x10],eax
 106:   8b 45 14                mov    eax,DWORD PTR [ebp+0x14]
 109:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 10c:   dd 45 f8                fld    QWORD PTR [ebp-0x8]
 10f:   dd 05 00 00 00 00       fld    QWORD PTR ds:0x0
 115:   de c1                   faddp  st(1),st
 117:   dd 45 f0                fld    QWORD PTR [ebp-0x10]
 11a:   dd 05 10 00 00 00       fld    QWORD PTR ds:0x10
 120:   de c1                   faddp  st(1),st
 122:   de c9                   fmulp  st(1),st
 124:   c9                      leave
 125:   c3                      ret
```

Observations

* A mix of floats and integers are both pushed onto the stack as 32-bit values.
* The logic reading the FPU control word temporarily masks out the Overflow (bit
  3) and Zero Divide (bit 2) exceptions. See the Intel FPU Manual.
* The type `double` takes 8-bytes on the stack.

The stack in the caller, based on `EBP` of the callee `funcdouble` looks like

| Offset               | Value                                                |
| -------------------- | ---------------------------------------------------- |
| `dword ptr [EBP+64]` | EBP                                                  |
| `dword ptr [EBP+60]` |                                                      |
| `dword ptr [EBP+56]` |                                                      |
| `dword ptr [EBP+52]` |                                                      |
| `dword ptr [EBP+48]` | Result, `funcdouble + 1.0`                           |
| `dword ptr [EBP+44]` |                                                      |
| `dword ptr [EBP+40]` |                                                      |
| `dword ptr [EBP+36]` | FPU Control Word                                     |
| `dword ptr [EBP+32]` | Result `(int)a`                                      |
| `dword ptr [EBP+28]` |                                                      |
| `dword ptr [EBP+24]` |                                                      |
| `dword ptr [EBP+20]` | `funcdouble` parameter 2, high 32-bit                |
| `dword ptr [EBP+16]` | `funcdouble` parameter 2, low 32-bit                 |
| `dword ptr [EBP+12]` | `funcdouble` parameter 1, high 32-bit                |
| `dword ptr [EBP+8]`  | `funcdouble` parameter 1, low 32-bit                 |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0x11A`                |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcfloatint` |
| `dword ptr [EBP-4]`  | Local stack `a + 1`, then `c + 3`                    |
| `dword ptr [EBP-8]`  | addr `EBP-6` = FPU control word                      |

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
00000168 <test_funcstructvalue>:
 168:   55                      push   ebp
 169:   89 e5                   mov    ebp,esp
 16b:   53                      push   ebx
 16c:   83 ec 64                sub    esp,0x64
 16f:   c7 45 c4 01 00 00 00    mov    DWORD PTR [ebp-0x3c],0x1
 176:   c7 45 c8 02 00 00 00    mov    DWORD PTR [ebp-0x38],0x2
 17d:   c7 45 cc 03 00 00 00    mov    DWORD PTR [ebp-0x34],0x3
 184:   c7 45 d0 04 00 00 00    mov    DWORD PTR [ebp-0x30],0x4
 18b:   c7 45 d4 05 00 00 00    mov    DWORD PTR [ebp-0x2c],0x5
 192:   c7 45 d8 06 00 00 00    mov    DWORD PTR [ebp-0x28],0x6
 199:   8d 55 dc                lea    edx,[ebp-0x24]
 19c:   b9 00 00 00 00          mov    ecx,0x0
 1a1:   b8 18 00 00 00          mov    eax,0x18
 1a6:   89 c3                   mov    ebx,eax
 1a8:   83 e3 fc                and    ebx,0xfffffffc
 1ab:   b8 00 00 00 00          mov    eax,0x0
 1b0:   89 0c 02                mov    DWORD PTR [edx+eax*1],ecx
 1b3:   83 c0 04                add    eax,0x4
 1b6:   39 d8                   cmp    eax,ebx
 1b8:   72 f6                   jb     1b0 <test_funcstructvalue+0x48>
 1ba:   01 c2                   add    edx,eax
 1bc:   8d 45 dc                lea    eax,[ebp-0x24]
 1bf:   89 44 24 18             mov    DWORD PTR [esp+0x18],eax
 1c3:   8b 45 c4                mov    eax,DWORD PTR [ebp-0x3c]
 1c6:   89 04 24                mov    DWORD PTR [esp],eax
 1c9:   8b 45 c8                mov    eax,DWORD PTR [ebp-0x38]
 1cc:   89 44 24 04             mov    DWORD PTR [esp+0x4],eax
 1d0:   8b 45 cc                mov    eax,DWORD PTR [ebp-0x34]
 1d3:   89 44 24 08             mov    DWORD PTR [esp+0x8],eax
 1d7:   8b 45 d0                mov    eax,DWORD PTR [ebp-0x30]
 1da:   89 44 24 0c             mov    DWORD PTR [esp+0xc],eax
 1de:   8b 45 d4                mov    eax,DWORD PTR [ebp-0x2c]
 1e1:   89 44 24 10             mov    DWORD PTR [esp+0x10],eax
 1e5:   8b 45 d8                mov    eax,DWORD PTR [ebp-0x28]
 1e8:   89 44 24 14             mov    DWORD PTR [esp+0x14],eax
 1ec:   e8 fc ff ff ff          call   1ed <test_funcstructvalue+0x85>
 1f1:   83 c0 01                add    eax,0x1
 1f4:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 1f7:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 1fa:   83 c4 64                add    esp,0x64
 1fd:   5b                      pop    ebx
 1fe:   5d                      pop    ebp
 1ff:   c3                      ret

00000126 <funcstructvalue>:
 126:   55                      push   ebp
 127:   89 e5                   mov    ebp,esp
 129:   8b 55 08                mov    edx,DWORD PTR [ebp+0x8]
 12c:   8b 45 20                mov    eax,DWORD PTR [ebp+0x20]
 12f:   8b 40 04                mov    eax,DWORD PTR [eax+0x4]
 132:   01 d0                   add    eax,edx
 134:   5d                      pop    ebp
 135:   c3                      ret
```

Observations

* Code lines `16f-192` initialises `struct mystruct x = {1, 2, 3, 4, 5, 6}`.
* Code lines `199-1ba` initialise `struct mystruct y = {0, }`.
* Code lines `1bc-1bf` stores the pointer to y on the stack as parameter 2.
* Code lines `1c3-1e8` copies x to the stack for parameter 1 and is unrolled.
* So the parameter x is passed on the stack, parameter 2 is immediately after
  the struct.
* The register `EBX` is stored on the stack as it must be preserved between
  function calls.

The stack in the caller, based on `EBP` of the callee `funcstructvalue` looks
like

| Offset                | Value                                                   |
| --------------------- | ------------------------------------------------------- |
| `dword ptr [EBP+112]` | EBP                                                     |
| `dword ptr [EBP+108]` | EBX                                                     |
| `dword ptr [EBP+104]` |                                                         |
| `dword ptr [EBP+100]` | int a = result + 1                                      |
| `dword ptr [EBP+96]`  | y.f = 0                                                 |
| `dword ptr [EBP+92]`  | y.e = 0                                                 |
| `dword ptr [EBP+88]`  | y.d = 0                                                 |
| `dword ptr [EBP+84]`  | y.c = 0                                                 |
| `dword ptr [EBP+80]`  | y.b = 0                                                 |
| `dword ptr [EBP+76]`  | y.a = 0                                                 |
| `dword ptr [EBP+72]`  | x.f = 6                                                 |
| `dword ptr [EBP+68]`  | x.e = 5                                                 |
| `dword ptr [EBP+64]`  | x.d = 4                                                 |
| `dword ptr [EBP+60]`  | x.c = 3                                                 |
| `dword ptr [EBP+56]`  | x.b = 2                                                 |
| `dword ptr [EBP+52]`  | x.a = 1                                                 |
| `dword ptr [EBP+48]`  |                                                         |
| `dword ptr [EBP+44]`  |                                                         |
| `dword ptr [EBP+40]`  |                                                         |
| `dword ptr [EBP+36]`  |                                                         |
| `dword ptr [EBP+32]`  | Parameter 2, `*y`                                       |
| `dword ptr [EBP+28]`  | x.f                                                     |
| `dword ptr [EBP+24]`  | x.e                                                     |
| `dword ptr [EBP+20]`  | x.d                                                     |
| `dword ptr [EBP+16]`  | x.c                                                     |
| `dword ptr [EBP+12]`  | x.b                                                     |
| `dword ptr [EBP+8]`   | Parameter 1, `x.a`                                      |
| `dword ptr [EBP+4]`   | Callers `EIP` return address, `0x1F1`                   |
| `dword ptr [EBP]`     | Callers `EBP` preserved by the callee `funcstructvalue` |

#### Returning a Struct by Value

Returning a struct by value is the most complicated calling method in the Sys V
ABI.

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
00000200 <test_funcstructret>:
 200:   55                      push   ebp
 201:   89 e5                   mov    ebp,esp
 203:   83 ec 38                sub    esp,0x38
 206:   8d 45 e0                lea    eax,[ebp-0x20]
 209:   c7 44 24 08 02 00 00    mov    DWORD PTR [esp+0x8],0x2
 210:   00
 211:   c7 44 24 04 01 00 00    mov    DWORD PTR [esp+0x4],0x1
 218:   00
 219:   89 04 24                mov    DWORD PTR [esp],eax
 21c:   e8 fc ff ff ff          call   21d <test_funcstructret+0x1d>
 221:   83 ec 04                sub    esp,0x4
 224:   8b 45 e0                mov    eax,DWORD PTR [ebp-0x20]
 227:   c9                      leave
 228:   c3                      ret

00000136 <funcstructret>:
 136:   55                      push   ebp
 137:   89 e5                   mov    ebp,esp
 139:   53                      push   ebx
 13a:   83 ec 20                sub    esp,0x20
 13d:   8d 55 e4                lea    edx,[ebp-0x1c]
 140:   b9 00 00 00 00          mov    ecx,0x0
 145:   b8 18 00 00 00          mov    eax,0x18
 14a:   89 c3                   mov    ebx,eax
 14c:   83 e3 fc                and    ebx,0xfffffffc
 14f:   b8 00 00 00 00          mov    eax,0x0
 154:   89 0c 02                mov    DWORD PTR [edx+eax*1],ecx
 157:   83 c0 04                add    eax,0x4
 15a:   39 d8                   cmp    eax,ebx
 15c:   72 f6                   jb     154 <funcstructret+0x1e>
 15e:   01 c2                   add    edx,eax
 160:   8b 45 0c                mov    eax,DWORD PTR [ebp+0xc]
 163:   89 45 e4                mov    DWORD PTR [ebp-0x1c],eax
 166:   8b 45 10                mov    eax,DWORD PTR [ebp+0x10]
 169:   89 45 e8                mov    DWORD PTR [ebp-0x18],eax
 16c:   8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
 16f:   8b 55 e4                mov    edx,DWORD PTR [ebp-0x1c]
 172:   89 10                   mov    DWORD PTR [eax],edx
 174:   8b 55 e8                mov    edx,DWORD PTR [ebp-0x18]
 177:   89 50 04                mov    DWORD PTR [eax+0x4],edx
 17a:   8b 55 ec                mov    edx,DWORD PTR [ebp-0x14]
 17d:   89 50 08                mov    DWORD PTR [eax+0x8],edx
 180:   8b 55 f0                mov    edx,DWORD PTR [ebp-0x10]
 183:   89 50 0c                mov    DWORD PTR [eax+0xc],edx
 186:   8b 55 f4                mov    edx,DWORD PTR [ebp-0xc]
 189:   89 50 10                mov    DWORD PTR [eax+0x10],edx
 18c:   8b 55 f8                mov    edx,DWORD PTR [ebp-0x8]
 18f:   89 50 14                mov    DWORD PTR [eax+0x14],edx
 192:   8b 45 08                mov    eax,DWORD PTR [ebp+0x8]
 195:   83 c4 20                add    esp,0x20
 198:   5b                      pop    ebx
 199:   5d                      pop    ebp
 19a:   c2 04 00                ret    0x4
```

Observations

* The first (hidden) parameter is a pointer to the callers stack, where the
  result should be given.
* The return struct is not initialised by the caller.
* Code lines `13a-15e` initialise `struct mystruct r = {0, }`.
* Code lines `160-163` copy parameter a, `r.a = a`.
* Code lines `166-169` copy parameter b, `r.b = b`.
* Code lines `16c-18f` copy the local variable `r` to the pointer for the return
  struct parameter 0. Note, we've called this parameter 0, as it's not explicit,
  but passed on the stack as if a pointer were given.
* Code line `192` prepares the return value, which is parameter 0, or the
  pointer to the return struct as per the Sys V ABI.
* The callee removes parameter 0 from the stack. This is different to the case
  if a function pointer was explicitly given in function signature. Thus, on
  return to the caller, `ESP` points to the first parameter (and not the pointer
  to the return value).

The stack in the caller, based on `EBP` of the callee `funcstructret` looks like

| Offset               | Value                                                 |
| -------------------- | ----------------------------------------------------- |
| `dword ptr [EBP+64]` | `EBP`                                                 |
| `dword ptr [EBP+60]` |                                                       |
| `dword ptr [EBP+56]` |                                                       |
| `dword ptr [EBP+52]` | `return.f`                                            |
| `dword ptr [EBP+48]` | `return.e`                                            |
| `dword ptr [EBP+44]` | `return.d`                                            |
| `dword ptr [EBP+40]` | `return.c`                                            |
| `dword ptr [EBP+36]` | `return.b`                                            |
| `dword ptr [EBP+32]` | `struct mystruct return`.a                            |
| `dword ptr [EBP+28]` |                                                       |
| `dword ptr [EBP+24]` |                                                       |
| `dword ptr [EBP+20]` |                                                       |
| `dword ptr [EBP+16]` | Parameter 2, value 2                                  |
| `dword ptr [EBP+12]` | Parameter 1, value 1                                  |
| `dword ptr [EBP+8]`  | Parameter 0, pointer to return struct `EBP-32`        |
| `dword ptr [EBP+4]`  | Callers `EIP` return address, `0x221`                 |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcstructret` |
| `dword ptr [EBP-4]`  |                                                       |
| `dword ptr [EBP-8]`  | r.f                                                   |
| `dword ptr [EBP-12]` | r.e                                                   |
| `dword ptr [EBP-16]` | r.d                                                   |
| `dword ptr [EBP-20]` | r.c                                                   |
| `dword ptr [EBP-24]` | r.b                                                   |
| `dword ptr [EBP-28]` | r.a                                                   |

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
0000019d <funcvarargs>:
 19d:   55                      push   ebp
 19e:   89 e5                   mov    ebp,esp
 1a0:   83 ec 10                sub    esp,0x10
 1a3:   8d 55 0c                lea    edx,[ebp+0xc]
 1a6:   8d 45 f4                lea    eax,[ebp-0xc]
 1a9:   89 10                   mov    DWORD PTR [eax],edx
 1ab:   c7 45 fc 00 00 00 00    mov    DWORD PTR [ebp-0x4],0x0
 1b2:   c7 45 f8 00 00 00 00    mov    DWORD PTR [ebp-0x8],0x0
 1b9:   eb 12                   jmp    1cd <funcvarargs+0x30>
 1bb:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 1be:   8d 50 04                lea    edx,[eax+0x4]
 1c1:   89 55 f4                mov    DWORD PTR [ebp-0xc],edx
 1c4:   8b 00                   mov    eax,DWORD PTR [eax]
 1c6:   01 45 fc                add    DWORD PTR [ebp-0x4],eax
 1c9:   83 45 f8 01             add    DWORD PTR [ebp-0x8],0x1
 1cd:   8b 45 f8                mov    eax,DWORD PTR [ebp-0x8]
 1d0:   3b 45 08                cmp    eax,DWORD PTR [ebp+0x8]
 1d3:   7c e6                   jl     1bb <funcvarargs+0x1e>
 1d5:   8b 45 fc                mov    eax,DWORD PTR [ebp-0x4]
 1d8:   c9                      leave
 1d9:   c3                      ret
```

Observations

* The instruction `va_list argptr` allocates stack space as a pointer
* The instruction `va_start(argptr, cnt)` sets `argptr` starting at parameter 2
* There are no implicit instructions or values on the stack to indicate how many
  parameters there are. Thus it's easy to override the stack if this function
  reads too many parameters!

The stack in the caller, based on `EBP` of the callee `funcvarargs` looks like

| Offset               | Value                                               |
| -------------------- | --------------------------------------------------- |
| `dword ptr [EBP+28]` |                                                     |
| `dword ptr [EBP+24]` |                                                     |
| `dword ptr [EBP+20]` | Parameter 4                                         |
| `dword ptr [EBP+16]` | Parameter 3                                         |
| `dword ptr [EBP+12]` | Parameter 2                                         |
| `dword ptr [EBP+8]`  | Parameter 1, `cnt`                                  |
| `dword ptr [EBP+4]`  | Callers `EIP` return address a                      |
| `dword ptr [EBP]`    | Callers `EBP` preserved by the callee `funcvarargs` |
| `dword ptr [EBP-4]`  | `int j`                                             |
| `dword ptr [EBP-8]`  | `int i`                                             |
| `dword ptr [EBP-12]` | `argptr`                                            |
| `dword ptr [EBP-16]` |                                                     |

The code shows an important point from a security perspective. Take the `printf`
instruction, which is also variadic. You should never accept a user provided
string which can affect the number of parameters that are to read. e.g if the
user were to enter a string in a textbox, you would happily read more data than
is allocated on the stack. Your program should check all inputs and then call
the variadic function.

##### A Single Parameter

```c
int test_funcvarargs1(void)
{
   int a;
   a = funcvarargs(1) + 1;
   return a;
}
```

```asm
00000229 <test_funcvarargs1>:
 229:   55                      push   ebp
 22a:   89 e5                   mov    ebp,esp
 22c:   83 ec 28                sub    esp,0x28
 22f:   c7 04 24 01 00 00 00    mov    DWORD PTR [esp],0x1
 236:   e8 fc ff ff ff          call   237 <test_funcvarargs1+0xe>
 23b:   83 c0 01                add    eax,0x1
 23e:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 241:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 244:   c9                      leave
 245:   c3                      ret
```

Observations

* For one parameter, only one value is pushed on the stack.

##### Four Parameters

```c
int test_funcvarargs4(void)
{
   int a;
   a = funcvarargs(4, 1, 2, 3, 4) + 1;
   return a;
}
```

```asm
00000246 <test_funcvarargs4>:
 246:   55                      push   ebp
 247:   89 e5                   mov    ebp,esp
 249:   83 ec 38                sub    esp,0x38
 24c:   c7 44 24 10 04 00 00    mov    DWORD PTR [esp+0x10],0x4
 253:   00
 254:   c7 44 24 0c 03 00 00    mov    DWORD PTR [esp+0xc],0x3
 25b:   00
 25c:   c7 44 24 08 02 00 00    mov    DWORD PTR [esp+0x8],0x2
 263:   00
 264:   c7 44 24 04 01 00 00    mov    DWORD PTR [esp+0x4],0x1
 26b:   00
 26c:   c7 04 24 04 00 00 00    mov    DWORD PTR [esp],0x4
 273:   e8 fc ff ff ff          call   274 <test_funcvarargs4+0x2e>
 278:   83 c0 01                add    eax,0x1
 27b:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 27e:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 281:   c9                      leave
 282:   c3                      ret
```

Observations

* As to be expected, values are pushed on the stack so the first parameter is at
  the lowest address.

##### Six Parameters

```c
int test_funcvarargs6(void)
{
   int a;
   a = funcvarargs(6, 2, 4, 6, 8, 10, 12) + 1;
   return a;
}
```

```asm
00000283 <test_funcvarargs6>:
 283:   55                      push   ebp
 284:   89 e5                   mov    ebp,esp
 286:   83 ec 38                sub    esp,0x38
 289:   c7 44 24 18 0c 00 00    mov    DWORD PTR [esp+0x18],0xc
 290:   00
 291:   c7 44 24 14 0a 00 00    mov    DWORD PTR [esp+0x14],0xa
 298:   00
 299:   c7 44 24 10 08 00 00    mov    DWORD PTR [esp+0x10],0x8
 2a0:   00
 2a1:   c7 44 24 0c 06 00 00    mov    DWORD PTR [esp+0xc],0x6
 2a8:   00
 2a9:   c7 44 24 08 04 00 00    mov    DWORD PTR [esp+0x8],0x4
 2b0:   00
 2b1:   c7 44 24 04 02 00 00    mov    DWORD PTR [esp+0x4],0x2
 2b8:   00
 2b9:   c7 04 24 06 00 00 00    mov    DWORD PTR [esp],0x6
 2c0:   e8 fc ff ff ff          call   2c1 <test_funcvarargs6+0x3e>
 2c5:   83 c0 01                add    eax,0x1
 2c8:   89 45 f4                mov    DWORD PTR [ebp-0xc],eax
 2cb:   8b 45 f4                mov    eax,DWORD PTR [ebp-0xc]
 2ce:   c9                      leave
 2cf:   c3                      ret
```

Observations

* As to be expected, values are pushed on the stack so the first parameter is at
  the lowest address.
