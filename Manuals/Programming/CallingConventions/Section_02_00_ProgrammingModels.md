# Programming Models

## 32-bit and 64-bit Environment Modes

There are three 64-bit programming models, depending on the Operating System and
architecture that is targetted. This information is useful when writing
cross-platform software.

|             | char | short | int | long | long long | void * |
| ----------- | ---- | ----- | --- | ---- | --------- | ------ |
| ILP64       | 8    | 16    | 64  | 64   | 64        | 64     |
| LP64        | 8    | 16    | 32  | 64   | 64        | 64     |
| LLP64 / P64 | 8    | 16    | 32  | 32   | 64        | 64     |
| ILP32       | 8    | 16    | 32  | 32   | 64        | 32     |
| LP32        | 8    | 16    | 16  | 32   | 64        | 32     |

* ILP64 is `int`, `long` and `long long`, and pointers are 64-bit.
* LP64 is `long` and `long long`, as well as pointers are 64-bit, `int` is 32-bits wide.
* LLP64 is `long long` and pointers are 64-bit.

When referring to the C-Standard:

> For any two integer types with the same signedness and different integer
> conversion rank, the range of values of the type with smaller integer
> conversion rank is a subrange of the values of the other type."

and further in the document

> "The rank of `long long int` shall be greater than the rank of `long int`,
> which shall be greater than the rank of `int`, which shall be greater than the
> rank of `short int`, which shall be greater than the rank of `signed char`.

The [CPP Reference](https://en.cppreference.com/w/cpp/language/types) lists the
types as well.

### Models used by OSes

| OS            | Processor    | Model 64-bit | Model 32-bit | Struct Pack                            |
| ------------- | ------------ | ------------ | ------------ | -------------------------------------- |
| Windows 3.1   | Intel        | -            | LP32         |                                        |
| MacOS Classic | 68k          | -            | LP32         |                                        |
| Windows NT    | ARM, Intel   | LLP64        | ILP32        | 8 (x86, ARM, ARM64), 16 (x64, ARM64EC) |
| Linux         | ARM, Intel   | LP64         | ILP32        |                                        |
| Free/OpenBSD  | ARM, Intel   | LP64         | ILP32        |                                        |
| MacOS X       | ARM, Intel   | LP64         | ILP32        |                                        |
| Solaris       | Intel, Sparc | LP64         | ILP32        |                                        |

Note that [ARM64EC](https://learn.microsoft.com/en-us/windows/arm/arm64ec) is an
ABI that specifies ARM64 Emulation Compatible for Windows 11 and later, to have
the same software calling conventions of x64.

References:

* [Windows](https://learn.microsoft.com/en-us/cpp/build/reference/zp-struct-member-alignment)

### Alignment of Fields in a Struct

On Windows (ARM and Intel), the compiler aligns class and struct members on
their size value: `bool` and `char` on 1-byte boundaries, `short` on 2-byte
boundaries, `int`, `long`, and `float` on 4-byte boundaries, and `long long`,
`double`, and `long double` on 8-byte boundaries. This matches also the size of
the datatypes for ILP32 and LLP64 so that alignment is on boundaries multiple of
the datasize type.

On Linux, the alignment of structs depends on the alignment of the largest type
in the structure, so as to guarantee all fields in the struct are natively
aligned.

Motorola 68k processors had alignment on 2-byte boundaries (even 32-bit values
can be aligned on 32-bit without penalty).

References:

* [Windows](https://learn.microsoft.com/en-us/cpp/cpp/alignment-cpp-declarations)
