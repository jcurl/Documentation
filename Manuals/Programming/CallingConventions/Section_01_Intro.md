# Introduction

Calling conventions are the rules that allow different software components,
written by different software vendors, potentially using different compilers or
different languages, to interface with one another.

In this paper you'll find examples of how compilers implement the calling
conventions. It does not replace the standards themselves. There is a lot of
information on the Internet but unfortunately, some of the terminology used is
not clear (ordering left to right, or right to left), they lack significant
details (variable argument lists, structures, floats) or need examples.

The code examples presented are in C. The output is disassembled by various
tools, dependent on the system that’s being run. For example, the `dumpbin.exe`
tool is used for Microsoft generated objects. On Unix type systems the tool
`objdump` is used.

## Definitions, Acronyms and Abbreviations

| Abbreviation | Meaning                                                                                                                |
| ------------ | ---------------------------------------------------------------------------------------------------------------------- |
| ABI          | Application Binary Interface                                                                                           |
| AMD          | Advanced Micro Design, Chip manufacturer producing Intel compatible CPUs and owning 64-bit extensions bit Binary Digit |
| callee       | Function code that is being called                                                                                     |
| caller       | Code that calls a function                                                                                             |
| cdecl        | C Declaration calling convention                                                                                       |
| CPU          | Central Processing Unit                                                                                                |
| GHz          | Gigahertz, or 1 million cycles per second                                                                              |
| Intel        | Microchip and CPU manufacturer                                                                                         |
| MSR          | Machine Specific Register                                                                                              |
| RAM          | Random Access Memory                                                                                                   |
| stdcall      | Standard Calling Convention                                                                                            |
| SVN          | Subversion Revision Control System                                                                                     |
| UUID         | Universally Unique Identifiers                                                                                         |
| x86          | Intel 80x86 32-bit compatible instruction set                                                                          |
| x64          | AMD 80x86 64-bit compatible instruction set                                                                            |

## Typographical Conventions

This document is prepared using the Markdown format. Screen information is
provided as monospaced text blocks. Default markdown code formatting is used for
code syntax highlighting.
