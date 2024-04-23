# ARM Architecture

## ARMv8-A with A64 Instruction Set

This page is a short summary of the most important parts of the ARMv8-A A64
instruction set. It is only intended for a quick reference, where [ARM Developer
Documentation](https://developer.arm.com/documentation) contains very good
references.

### General Purpose Registers

There are 31 general purpose registers (called `Rx`):

* `X0` - `X30` indicate 64-bit usage.
* `W0` - `W30` indicate 32-bit usage with the upper 32-bits cleared.

Aliases for registers:

* `X30` is used as the _Link Register_, also referred to as `LR`.
* `X29` is used as the _Frame Pointer Register_, also referred to as `FP`.

Register 31 is either referenced as the stack pointer (`SP`, which is dependent
on the privilege level, and not considered general purpose) or `XZR` / `WZR` for
reading zero.

### Floating Point Registers

There are 32 general purpose floating point registers (called `Vx`):

* `Q0` - `Q31` for 128-bit usage.
* `D0` - `D31` for 64-bit usage.
* `S0` - `S31` for 32-bit usage.
* `H0` - `H31` for 16-bit usage, FP16 since ARMv8.2-A (mandatory in ARMv9-A),
  BF16 since ARMv8.2-A (mandatory in ARMv8.6-A).
* `B0` - `B31` for 8-bit (FP8) usage, since ARMv9.2-A.

Properties of the floating point types:

| Type              | Exponent Size | Mantissa |
| ----------------- | ------------- | -------- |
| Quadword, 128-bit | 15            | 112      |
| Double, 64-bit    | 11            | 52       |
| Single, 32-bit    | 8             | 23       |
| FP16, 16-bit      | 5             | 10       |
| BF16, 16-bit      | 8             | 7        |
| FP8, E5M2         | 5             | 2        |
| FP8, E4M3         | 4             | 3        |

### Calling Conventions

| Register | Alias | Role in the Procedure Call Standard                                    |
| -------- | ----- | ---------------------------------------------------------------------- |
| SP       |       | Stack Pointer. Must be preserved between subroutines.                  |
| R30      | LR    | Link Register. Must be preserved between subroutines.                  |
| R29      | FP    | Frame Pointer. Must be preserved between subroutines.                  |
| R19..R28 |       | Callee-saved registers. Must be preserved between subroutines.         |
| R18      |       | The Platform Register, if needed; else a temporary register.           |
| R17      | IP1   | Second intra-procedure-call temporary register.                        |
| R16      | IP0   | First intra-procedure-call temporary register.                         |
| R9..R15  |       | Temporary registers.                                                   |
| R8       |       | Indirect result location register.                                     |
| R0..R7   |       | Parameter / Result registers. Further parameters are put on the stack. |
| V0..V7   |       | Parameter / Result registers. Further parameters are put on the stack. |
