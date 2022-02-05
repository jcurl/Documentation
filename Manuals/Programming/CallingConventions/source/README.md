# Reference Sources

The sources in this directory are used to test the ABI on the various systems by
trying different scenarios. By compiling and then decompiling to assembly with
`objdump`, we can then analyse the results and compare to any specifications
standards, such as the Sys V ABI.

## Compilation

Compilation works on Cygwin and Linux, but should work on other Unix like OSes.

```sh
make
```

If you want to use different compilers, then provide the compiler and tools with
the following substitutions:

* `CC`: The compiler to use
* `OBJDUMP`: The program to reverse compile the binaries

For example, if on Cygwin-64 and cross-compiling to 32-bit MSYS:

```sh
CC=i686-w64-mingw32-gcc OBJDUMP=i686-w64-mingw32-objdump make
```

## Output

This directory contains the following compiled and decompiled versions

* `output/pei-i386_mingw32`: Cygwin cross compiled with `i686-w64-mingw32-gcc`
  11.2.0
* `output/pei-x86-x64_mingw32`: Cygwin cross compiled with
  `x86_64-w64-mingw32-gcc` 11.2.0
* `output/elf32-i386`: Ubuntu 18.04 `gcc` 7.5.0
* `output/elf64-x86-64`: Ubuntu 20.04 `gcc` 9.3.0
