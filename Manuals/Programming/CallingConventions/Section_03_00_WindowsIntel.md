# Windows - Intel Architecture

In this part, we cover various used calling conventions used on Windows
computers, particularly the Intel architecture (both 32-bit and 64-bit).
Information is based on Visual Studio compilers.

The examples provided here are compiled using the Microsoft Visual Studio 2012
compilers using default settings (which provide generally for SSE2 type
instructions). In some cases, the compiler has been configured to produce
standard code with the `/arch:ia32` option.
