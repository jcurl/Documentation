## GCC: 64-bit 12.2.0 Debian 12 on Raspberry Pi4B

### Examples

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
00000000000009e0 <test_funcintr>:
 9e0:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 9e4:   910003fd        mov     x29, sp
 9e8:   97ffff4b        bl      714 <funcintr>
 9ec:   11000400        add     w0, w0, #0x1
 9f0:   b9001fe0        str     w0, [sp, #28]
 9f4:   b9401fe0        ldr     w0, [sp, #28]
 9f8:   a8c27bfd        ldp     x29, x30, [sp], #32
 9fc:   d65f03c0        ret

0000000000000714 <funcintr>:
 714:   52800540        mov     w0, #0x2a                       // #42
 718:   d65f03c0        ret
```

Observations

* `9e0` saves x29 and x30 onto the stack. It decrements the stack pointer by
  0x20 bytes, and then puts in at the stack X29 (the frame pointer), followed by X30
  (the return address, link-register).
* `9e4` is copying the stack-pointer to the frame-pointer.
* `9e8` is the branch with link, updating X30 to PC+4, making a subroutine call.
  X30 is the link register, which is the instruction to return to on return.
* As per the calling convention
  * X30 contains the return address (it is not put on the stack). Caused by the
    `bl` instruction
  * Values are returned on `R0`.
  * The stack is not used for passing parameters (until we have more than )

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
0000000000000a00 <test_funcint64r>:
 a00:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 a04:   910003fd        mov     x29, sp
 a08:   97ffff45        bl      71c <funcint64r>
 a0c:   91000400        add     x0, x0, #0x1
 a10:   f9000fe0        str     x0, [sp, #24]
 a14:   f9400fe0        ldr     x0, [sp, #24]
 a18:   a8c27bfd        ldp     x29, x30, [sp], #32
 a1c:   d65f03c0        ret

000000000000071c <funcint64r>:
 71c:   d2c00840        mov     x0, #0x4200000000               // #283467841536
 720:   d65f03c0        ret
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
0000000000000a20 <test_funcint64r2>:
 a20:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 a24:   910003fd        mov     x29, sp
 a28:   97ffff3f        bl      724 <funcint64r2>
 a2c:   91000400        add     x0, x0, #0x1
 a30:   f9000fe0        str     x0, [sp, #24]
 a34:   f9400fe0        ldr     x0, [sp, #24]
 a38:   a8c27bfd        ldp     x29, x30, [sp], #32
 a3c:   d65f03c0        ret

0000000000000724 <funcint64r2>:
 724:   d2800540        mov     x0, #0x2a                       // #42
 728:   d65f03c0        ret
```

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
0000000000000a40 <test_funcint>:
 a40:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 a44:   910003fd        mov     x29, sp
 a48:   52800062        mov     w2, #0x3                        // #3
 a4c:   52800041        mov     w1, #0x2                        // #2
 a50:   52800020        mov     w0, #0x1                        // #1
 a54:   97ffff36        bl      72c <funcint>
 a58:   11000400        add     w0, w0, #0x1
 a5c:   b9001fe0        str     w0, [sp, #28]
 a60:   b9401fe0        ldr     w0, [sp, #28]
 a64:   a8c27bfd        ldp     x29, x30, [sp], #32
 a68:   d65f03c0        ret

000000000000072c <funcint>:
 72c:   d10043ff        sub     sp, sp, #0x10
 730:   b9000fe0        str     w0, [sp, #12]
 734:   b9000be1        str     w1, [sp, #8]
 738:   b90007e2        str     w2, [sp, #4]
 73c:   b9400fe0        ldr     w0, [sp, #12]
 740:   11000401        add     w1, w0, #0x1
 744:   b9400be0        ldr     w0, [sp, #8]
 748:   11000800        add     w0, w0, #0x2
 74c:   1b007c21        mul     w1, w1, w0
 750:   b94007e0        ldr     w0, [sp, #4]
 754:   11000c00        add     w0, w0, #0x3
 758:   1b007c20        mul     w0, w1, w0
 75c:   910043ff        add     sp, sp, #0x10
 760:   d65f03c0        ret
```

Observations

* The parameter parsing puts the three parameters as `w0`, `w1`, `w2`.
* The function `funcint` allocates 16-bytes for its stack at line `730`,
  releasing the stack at line `75c`. Stacks must be aligned to 16-bytes if any
  addresses are used.
* `funcint` is unoptimised, so it uses 12 bytes on the stack.
* `funcint` doesn't create a frame with `stp`.

The stack in `funcint` at instruction `730` looks like:

| Offset      | Value                                |
| ----------- | ------------------------------------ |
| `[sp]`      | Not used.                            |
| `[sp, #4]`  | `int c`                              |
| `[sp, #8]`  | `int b`                              |
| `[sp, #12]` | `int a`                              |
| `[sp, #16]` | `X29` Frame Pointer                  |
| `[sp, #32]` | `X30` Link Register, which is `a58`. |

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
0000000000000a6c <test_funcchar>:
 a6c:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 a70:   910003fd        mov     x29, sp
 a74:   52800041        mov     w1, #0x2                        // #2
 a78:   52800020        mov     w0, #0x1                        // #1
 a7c:   97ffff3a        bl      764 <funcchar>
 a80:   11000400        add     w0, w0, #0x1
 a84:   b9001fe0        str     w0, [sp, #28]
 a88:   b9401fe0        ldr     w0, [sp, #28]
 a8c:   a8c27bfd        ldp     x29, x30, [sp], #32
 a90:   d65f03c0        ret

0000000000000764 <funcchar>:
 764:   d10043ff        sub     sp, sp, #0x10
 768:   39003fe0        strb    w0, [sp, #15]
 76c:   39003be1        strb    w1, [sp, #14]
 770:   39403fe0        ldrb    w0, [sp, #15]
 774:   11000401        add     w1, w0, #0x1
 778:   39403be0        ldrb    w0, [sp, #14]
 77c:   11000800        add     w0, w0, #0x2
 780:   1b007c20        mul     w0, w1, w0
 784:   910043ff        add     sp, sp, #0x10
 788:   d65f03c0        ret
```

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
0000000000000a94 <test_funcfloat>:
 a94:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 a98:   910003fd        mov     x29, sp
 a9c:   1e211002        fmov    s2, #3.000000000000000000e+00
 aa0:   1e201001        fmov    s1, #2.000000000000000000e+00
 aa4:   1e2e1000        fmov    s0, #1.000000000000000000e+00
 aa8:   97ffff39        bl      78c <funcfloat>
 aac:   1e22c001        fcvt    d1, s0
 ab0:   1e621000        fmov    d0, #4.000000000000000000e+00
 ab4:   1e602820        fadd    d0, d1, d0
 ab8:   1e624000        fcvt    s0, d0
 abc:   bd001fe0        str     s0, [sp, #28]
 ac0:   bd401fe0        ldr     s0, [sp, #28]
 ac4:   5ea1b800        fcvtzs  s0, s0
 ac8:   1e260000        fmov    w0, s0
 acc:   a8c27bfd        ldp     x29, x30, [sp], #32
 ad0:   d65f03c0        ret

000000000000078c <funcfloat>:
 78c:   d10043ff        sub     sp, sp, #0x10
 790:   bd000fe0        str     s0, [sp, #12]
 794:   bd000be1        str     s1, [sp, #8]
 798:   bd0007e2        str     s2, [sp, #4]
 79c:   bd400fe0        ldr     s0, [sp, #12]
 7a0:   1e22c001        fcvt    d1, s0
 7a4:   1e6e1000        fmov    d0, #1.000000000000000000e+00
 7a8:   1e602821        fadd    d1, d1, d0
 7ac:   bd400be0        ldr     s0, [sp, #8]
 7b0:   1e22c002        fcvt    d2, s0
 7b4:   1e601000        fmov    d0, #2.000000000000000000e+00
 7b8:   1e602840        fadd    d0, d2, d0
 7bc:   1e600821        fmul    d1, d1, d0
 7c0:   bd4007e0        ldr     s0, [sp, #4]
 7c4:   1e22c002        fcvt    d2, s0
 7c8:   1e611000        fmov    d0, #3.000000000000000000e+00
 7cc:   1e602840        fadd    d0, d2, d0
 7d0:   1e600820        fmul    d0, d1, d0
 7d4:   1e624000        fcvt    s0, d0
 7d8:   910043ff        add     sp, sp, #0x10
 7dc:   d65f03c0        ret
```

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
0000000000000ad4 <test_funcfloatint>:
 ad4:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 ad8:   910003fd        mov     x29, sp
 adc:   1e221001        fmov    s1, #4.000000000000000000e+00
 ae0:   52800061        mov     w1, #0x3                        // #3
 ae4:   1e201000        fmov    s0, #2.000000000000000000e+00
 ae8:   52800020        mov     w0, #0x1                        // #1
 aec:   97ffff3d        bl      7e0 <funcfloatint>
 af0:   11000400        add     w0, w0, #0x1
 af4:   b9001fe0        str     w0, [sp, #28]
 af8:   b9401fe0        ldr     w0, [sp, #28]
 afc:   a8c27bfd        ldp     x29, x30, [sp], #32
 b00:   d65f03c0        ret

00000000000007e0 <funcfloatint>:
 7e0:   d10043ff        sub     sp, sp, #0x10
 7e4:   b9000fe0        str     w0, [sp, #12]
 7e8:   bd000be0        str     s0, [sp, #8]
 7ec:   b90007e1        str     w1, [sp, #4]
 7f0:   bd0003e1        str     s1, [sp]
 7f4:   b9400fe0        ldr     w0, [sp, #12]
 7f8:   11000400        add     w0, w0, #0x1
 7fc:   1e620001        scvtf   d1, w0
 800:   bd400be0        ldr     s0, [sp, #8]
 804:   1e22c002        fcvt    d2, s0
 808:   1e601000        fmov    d0, #2.000000000000000000e+00
 80c:   1e602840        fadd    d0, d2, d0
 810:   1e600821        fmul    d1, d1, d0
 814:   b94007e0        ldr     w0, [sp, #4]
 818:   11000c00        add     w0, w0, #0x3
 81c:   1e620000        scvtf   d0, w0
 820:   1e600821        fmul    d1, d1, d0
 824:   bd4003e0        ldr     s0, [sp]
 828:   1e22c002        fcvt    d2, s0
 82c:   1e621000        fmov    d0, #4.000000000000000000e+00
 830:   1e602840        fadd    d0, d2, d0
 834:   1e600820        fmul    d0, d1, d0
 838:   1e780000        fcvtzs  w0, d0
 83c:   910043ff        add     sp, sp, #0x10
 840:   d65f03c0        ret
```

Observations:

* We see that the registers are used for passing the parameters and no stack is
  used. The `Rx` and `Vx` are handled independently, i.e. the ordering of the
  parameters in between `float` and `int` are unknown.
* The unoptimised `funcfloatint` copies the parameters onto the stack before
  processing them.

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
0000000000000b04 <test_funcdouble>:
 b04:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 b08:   910003fd        mov     x29, sp
 b0c:   1e621001        fmov    d1, #4.000000000000000000e+00
 b10:   1e601000        fmov    d0, #2.000000000000000000e+00
 b14:   97ffff4c        bl      844 <funcdouble>
 b18:   1e604001        fmov    d1, d0
 b1c:   1e6e1000        fmov    d0, #1.000000000000000000e+00
 b20:   1e602820        fadd    d0, d1, d0
 b24:   fd000fe0        str     d0, [sp, #24]
 b28:   fd400fe0        ldr     d0, [sp, #24]
 b2c:   1e780000        fcvtzs  w0, d0
 b30:   a8c27bfd        ldp     x29, x30, [sp], #32
 b34:   d65f03c0        ret

0000000000000844 <funcdouble>:
 844:   d10043ff        sub     sp, sp, #0x10
 848:   fd0007e0        str     d0, [sp, #8]
 84c:   fd0003e1        str     d1, [sp]
 850:   fd4007e1        ldr     d1, [sp, #8]
 854:   1e601000        fmov    d0, #2.000000000000000000e+00
 858:   1e602821        fadd    d1, d1, d0
 85c:   fd4003e2        ldr     d2, [sp]
 860:   1e621000        fmov    d0, #4.000000000000000000e+00
 864:   1e602840        fadd    d0, d2, d0
 868:   1e600820        fmul    d0, d1, d0
 86c:   910043ff        add     sp, sp, #0x10
 870:   d65f03c0        ret
```

Observations

* The only difference in the size of the `float` to `double` is the register
  that is used.

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
0000000000000b38 <test_funcstructvalue>:
 b38:   a9b97bfd        stp     x29, x30, [sp, #-112]!
 b3c:   910003fd        mov     x29, sp
 b40:   90000000        adrp    x0, 0 <__abi_tag-0x278>
 b44:   91366000        add     x0, x0, #0xd98
 b48:   910143e2        add     x2, sp, #0x50
 b4c:   aa0003e3        mov     x3, x0
 b50:   a9400460        ldp     x0, x1, [x3]
 b54:   a9000440        stp     x0, x1, [x2]
 b58:   f9400860        ldr     x0, [x3, #16]
 b5c:   f9000840        str     x0, [x2, #16]
 b60:   a903ffff        stp     xzr, xzr, [sp, #56]
 b64:   f90027ff        str     xzr, [sp, #72]
 b68:   910043e2        add     x2, sp, #0x10
 b6c:   910143e3        add     x3, sp, #0x50
 b70:   a9400460        ldp     x0, x1, [x3]
 b74:   a9000440        stp     x0, x1, [x2]
 b78:   f9400860        ldr     x0, [x3, #16]
 b7c:   f9000840        str     x0, [x2, #16]
 b80:   9100e3e1        add     x1, sp, #0x38
 b84:   910043e0        add     x0, sp, #0x10
 b88:   97ffff3b        bl      874 <funcstructvalue>
 b8c:   11000400        add     w0, w0, #0x1
 b90:   b9006fe0        str     w0, [sp, #108]
 b94:   b9406fe0        ldr     w0, [sp, #108]
 b98:   a8c77bfd        ldp     x29, x30, [sp], #112
 b9c:   d65f03c0        ret

0000000000000874 <funcstructvalue>:
 874:   f81e0ff3        str     x19, [sp, #-32]!
 878:   aa0003f3        mov     x19, x0
 87c:   f9000fe1        str     x1, [sp, #24]
 880:   b9400261        ldr     w1, [x19]
 884:   f9400fe0        ldr     x0, [sp, #24]
 888:   b9400400        ldr     w0, [x0, #4]
 88c:   0b000020        add     w0, w1, w0
 890:   f84207f3        ldr     x19, [sp], #32
 894:   d65f03c0        ret
```

Observations

* When generating the stack frame at line `b38`, it now allocates much more
  stack space than in the previous examples. The stack is decremented by 112
  bytes, then `X29` (Frame-Pointer) followed by `X30` (Link-Register) is pushed
  on the stack. That leaves from offset 0x20 another 80 bytes for this function
  call.
* The `adrp` instruction on line `b40`, followed by the offset of 0xD98 on line
  `b44` sets register `X0` to point to the structure `struct mystruct x`.
* `b48` sets `X2` to be a pointer to 80 bytes on the stack. From here, until the
  branch-link instruction, it is copying the structure onto the stack (`x`),
  then zeroing the structure `y`, and then passing the pointer to the structure
  value on the stack `x`, and the pointer `y` as `X0` and `X1` respectively.
* In `funcstructvalue`, it uses `X19` to remember the pointer to the structure.
* The address of `[x0]` on entry is `x.a`. The address of `[x1, #4]` is `y->b`.

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
0000000000000ba0 <test_funcstructret>:
 ba0:   a9bd7bfd        stp     x29, x30, [sp, #-48]!
 ba4:   910003fd        mov     x29, sp
 ba8:   910063e0        add     x0, sp, #0x18
 bac:   aa0003e8        mov     x8, x0
 bb0:   52800041        mov     w1, #0x2                        // #2
 bb4:   52800020        mov     w0, #0x1                        // #1
 bb8:   97ffff38        bl      898 <funcstructret>
 bbc:   b9401be0        ldr     w0, [sp, #24]
 bc0:   a8c37bfd        ldp     x29, x30, [sp], #48
 bc4:   d65f03c0        ret

0000000000000898 <funcstructret>:
 898:   d100c3ff        sub     sp, sp, #0x30
 89c:   aa0803e2        mov     x2, x8
 8a0:   b9000fe0        str     w0, [sp, #12]
 8a4:   b9000be1        str     w1, [sp, #8]
 8a8:   a901ffff        stp     xzr, xzr, [sp, #24]
 8ac:   f90017ff        str     xzr, [sp, #40]
 8b0:   b9400fe0        ldr     w0, [sp, #12]
 8b4:   b9001be0        str     w0, [sp, #24]
 8b8:   b9400be0        ldr     w0, [sp, #8]
 8bc:   b9001fe0        str     w0, [sp, #28]
 8c0:   aa0203e3        mov     x3, x2
 8c4:   910063e2        add     x2, sp, #0x18
 8c8:   a9400440        ldp     x0, x1, [x2]
 8cc:   a9000460        stp     x0, x1, [x3]
 8d0:   f9400840        ldr     x0, [x2, #16]
 8d4:   f9000860        str     x0, [x3, #16]
 8d8:   9100c3ff        add     sp, sp, #0x30
 8dc:   d65f03c0        ret
```

Observation:

* The space for `struct mystruct x` is allocated on the stack of
  `test_funcstructret`. Register `X8` is important here, as it is contains the
  pointer to where the return value should be.
* `test_funcstructret` calls the function with the parameters `W0=1` and `W1=2`.
* `funcstructret` is rather unoptimised here
  * It puts `a` and `b` on the stack
  * Creates `struct mystruct r` and zeroes it on lines `8a8` and `8ac`.
  * `8b0` and `8b4` stores `a` into `r`
  * `8b8` and `8bc` stores `b` into `r`
  * `8c0` is now the return pointer in `x3`, and here it copies `r` to `x3` /
    `x8`.

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

int test_funcvarargs1(void)
{
  int a;
  a = funcvarargs(1) + 1;
  return a;
}

int test_funcvarargs6(void)
{
  int a;
  a = funcvarargs(6, 2, 4, 6, 8, 10, 12) + 1;
  return a;
}

```

```asm
0000000000000bc8 <test_funcvarargs1>:
 bc8:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 bcc:   910003fd        mov     x29, sp
 bd0:   52800020        mov     w0, #0x1                        // #1
 bd4:   97ffff43        bl      8e0 <funcvarargs>
 bd8:   11000400        add     w0, w0, #0x1
 bdc:   b9001fe0        str     w0, [sp, #28]
 be0:   b9401fe0        ldr     w0, [sp, #28]
 be4:   a8c27bfd        ldp     x29, x30, [sp], #32
 be8:   d65f03c0        ret

0000000000000c20 <test_funcvarargs6>:
 c20:   a9be7bfd        stp     x29, x30, [sp, #-32]!
 c24:   910003fd        mov     x29, sp
 c28:   52800186        mov     w6, #0xc                        // #12
 c2c:   52800145        mov     w5, #0xa                        // #10
 c30:   52800104        mov     w4, #0x8                        // #8
 c34:   528000c3        mov     w3, #0x6                        // #6
 c38:   52800082        mov     w2, #0x4                        // #4
 c3c:   52800041        mov     w1, #0x2                        // #2
 c40:   528000c0        mov     w0, #0x6                        // #6
 c44:   97ffff27        bl      8e0 <funcvarargs>
 c48:   11000400        add     w0, w0, #0x1
 c4c:   b9001fe0        str     w0, [sp, #28]
 c50:   b9401fe0        ldr     w0, [sp, #28]
 c54:   a8c27bfd        ldp     x29, x30, [sp], #32
 c58:   d65f03c0        ret

00000000000008e0 <funcvarargs>:
 8e0:   d10403ff        sub     sp, sp, #0x100
 8e4:   b9000fe0        str     w0, [sp, #12]
 8e8:   f90067e1        str     x1, [sp, #200]
 8ec:   f9006be2        str     x2, [sp, #208]
 8f0:   f9006fe3        str     x3, [sp, #216]
 8f4:   f90073e4        str     x4, [sp, #224]
 8f8:   f90077e5        str     x5, [sp, #232]
 8fc:   f9007be6        str     x6, [sp, #240]
 900:   f9007fe7        str     x7, [sp, #248]
 904:   3d8013e0        str     q0, [sp, #64]
 908:   3d8017e1        str     q1, [sp, #80]
 90c:   3d801be2        str     q2, [sp, #96]
 910:   3d801fe3        str     q3, [sp, #112]
 914:   3d8023e4        str     q4, [sp, #128]
 918:   3d8027e5        str     q5, [sp, #144]
 91c:   3d802be6        str     q6, [sp, #160]
 920:   3d802fe7        str     q7, [sp, #176]
 924:   910403e0        add     x0, sp, #0x100
 928:   f9000fe0        str     x0, [sp, #24]
 92c:   910403e0        add     x0, sp, #0x100
 930:   f90013e0        str     x0, [sp, #32]
 934:   910303e0        add     x0, sp, #0xc0
 938:   f90017e0        str     x0, [sp, #40]
 93c:   128006e0        mov     w0, #0xffffffc8                 // #-56
 940:   b90033e0        str     w0, [sp, #48]
 944:   12800fe0        mov     w0, #0xffffff80                 // #-128
 948:   b90037e0        str     w0, [sp, #52]
 94c:   b9003bff        str     wzr, [sp, #56]
 950:   b9003fff        str     wzr, [sp, #60]
 954:   1400001c        b       9c4 <funcvarargs+0xe4>
 958:   b94033e1        ldr     w1, [sp, #48]
 95c:   f9400fe0        ldr     x0, [sp, #24]
 960:   7100003f        cmp     w1, #0x0
 964:   540000ab        b.lt    978 <funcvarargs+0x98>  // b.tstop
 968:   91002c01        add     x1, x0, #0xb
 96c:   927df021        and     x1, x1, #0xfffffffffffffff8
 970:   f9000fe1        str     x1, [sp, #24]
 974:   1400000d        b       9a8 <funcvarargs+0xc8>
 978:   11002022        add     w2, w1, #0x8
 97c:   b90033e2        str     w2, [sp, #48]
 980:   b94033e2        ldr     w2, [sp, #48]
 984:   7100005f        cmp     w2, #0x0
 988:   540000ad        b.le    99c <funcvarargs+0xbc>
 98c:   91002c01        add     x1, x0, #0xb
 990:   927df021        and     x1, x1, #0xfffffffffffffff8
 994:   f9000fe1        str     x1, [sp, #24]
 998:   14000004        b       9a8 <funcvarargs+0xc8>
 99c:   f94013e2        ldr     x2, [sp, #32]
 9a0:   93407c20        sxtw    x0, w1
 9a4:   8b000040        add     x0, x2, x0
 9a8:   b9400000        ldr     w0, [x0]
 9ac:   b9403be1        ldr     w1, [sp, #56]
 9b0:   0b000020        add     w0, w1, w0
 9b4:   b9003be0        str     w0, [sp, #56]
 9b8:   b9403fe0        ldr     w0, [sp, #60]
 9bc:   11000400        add     w0, w0, #0x1
 9c0:   b9003fe0        str     w0, [sp, #60]
 9c4:   b9403fe1        ldr     w1, [sp, #60]
 9c8:   b9400fe0        ldr     w0, [sp, #12]
 9cc:   6b00003f        cmp     w1, w0
 9d0:   54fffc4b        b.lt    958 <funcvarargs+0x78>  // b.tstop
 9d4:   b9403be0        ldr     w0, [sp, #56]
 9d8:   910403ff        add     sp, sp, #0x100
 9dc:   d65f03c0        ret
```

Observation

* The caller just simply uses the calling convention, putting all its values
  into the registers like a normal function call.
* Because the compiler can't know upfront how many arguments it will receive, it
  must push all parameters that can arrive via the registers onto the stack.
* The macro then iterates over the stack via `X0`.
