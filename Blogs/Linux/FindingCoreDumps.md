# Find My Core Dump on Ubuntu <!-- omit in toc -->

I was trying to identify a fault in my software through the use of asserts. This
generates a `SIGABRT` if the assert criteria results in `false`, so I should be
able to get a core dump, load it in `gdb` and then determine the back trace.

The word "core" dump comes from the 1960's, where memory was a physical crossing
of wires, where storage of bits was maintained with the help of magnetic cores.
To take a core dump, was to capture the state of the magnetic cores. Since then,
memory is implemented as charged capacitors and transistors (DRAM) or flip-flops
(SRAM), but the term has remained. Today, it's also called a "memory dump" which
is closer to what is intended.

This document uses the term `core` however, as it's still prevmalent in the
industry and the name Linux (and many other Unix variants) still use.

- [1. Default Core Dumps on Linux](#1-default-core-dumps-on-linux)
  - [1.1. The man page](#11-the-man-page)
  - [1.2. The default Core](#12-the-default-core)
- [2. Limits of a Core Dump](#2-limits-of-a-core-dump)
  - [2.1. Core Dump Limits](#21-core-dump-limits)
  - [2.2. Increasing the Limits as Root](#22-increasing-the-limits-as-root)
  - [2.3. Setting the Limits on the System](#23-setting-the-limits-on-the-system)
  - [2.4. Why Core Dumps are Disabled](#24-why-core-dumps-are-disabled)
- [3. Piping a Core Dump](#3-piping-a-core-dump)
  - [3.1. Apport on Ubuntu](#31-apport-on-ubuntu)
  - [3.2. The Command Line](#32-the-command-line)
  - [3.3. Core Dumps and Output to the User](#33-core-dumps-and-output-to-the-user)
  - [3.4. Limits Handling for User Space Core Dump Programs](#34-limits-handling-for-user-space-core-dump-programs)
- [4. Where's my Core Dump on Ubuntu?](#4-wheres-my-core-dump-on-ubuntu)
  - [4.1. User Core Dumps with Apport](#41-user-core-dumps-with-apport)
  - [4.2. Apport User Core Dumps with a Non-zero Limit](#42-apport-user-core-dumps-with-a-non-zero-limit)
  - [4.3. Apport Package Core Dumps](#43-apport-package-core-dumps)
    - [4.3.1. Location of the Crash File](#431-location-of-the-crash-file)
    - [4.3.2. Unpacking a Crash File](#432-unpacking-a-crash-file)
    - [4.3.3. Limits for a Crash File](#433-limits-for-a-crash-file)
- [5. Further Use Cases](#5-further-use-cases)
  - [5.1. Using an Address Sanitizer](#51-using-an-address-sanitizer)
    - [5.1.1. Where's My Core Dump?](#511-wheres-my-core-dump)
    - [5.1.2. Debugging the Limits](#512-debugging-the-limits)
    - [5.1.3. Analysing the Program](#513-analysing-the-program)
    - [5.1.4. Root Cause - Address Sanitizer](#514-root-cause---address-sanitizer)
  - [5.2. Sending a SIGKILL](#52-sending-a-sigkill)

## 1. Default Core Dumps on Linux

### 1.1. The man page

The [core.5](https://man7.org/linux/man-pages/man5/core.5.html) manual page
would be the first place anyone understanding core dumps on Linux should start.

It describes the `RLIMIT_CORE`, which can be set by your shell and your OS
vendor. It talks about the `sysctl` interfaces:

* `kernel.corepattern`
* `kernel.core_uses_pid`
* `fs.suid_dumpable`

It's very good, and this blog will contains some other nuances that one should
know about when trying to figure out where their core dump could be, or why it's
not visible anywhere.

### 1.2. The default Core

By default, the core dump is just `core`. Unless the parameter
`kernel.core_uses_pid` is set, then it's `core.%p`, and it's written to the
current directory. This respects the `ulimit` sizes given,

Let's check

```sh
$ sysctl kernel.corepattern
core
$ sysctl kernel.core_uses_pid
1
$ sysctl fs.suid_dumpable
2
```

## 2. Limits of a Core Dump

### 2.1. Core Dump Limits

So the Kernel will create core dumps in the current directory as said. Will it
though? The default limits for your Operating System Vendor might be off. We can
check.

```sh
$ ulimit -S -c
0
$ ulimit -H -c
0
```

If the limits given above are zero, then the Kernel will not generate core
dumps. On an exception, you might just see

```sh
Aborted
```

What we want to see is

```sh
Aborted (core dumped)
```

### 2.2. Increasing the Limits as Root

Let's enable the core dump for our session.

```sh
$ ulimit -H -c unlimited
bash: ulimit: core file size: cannot modify limit: Invalid argument
```

This is a privileged operation. Only those with root can increase the limit.

```sh
root$ ulimit -H -c unlimited
root$ ulimit -H -c
unlimited
```

However, not very practical, as the limits are inherited, so one would have to
go to root, create a new shall based on the modified limits. We need to update
the security configuration.

Generally, a non-root user can only reduce the hard limit (so long as it is not
lower than the current soft limit), and the soft limit can be changed at any
time.

### 2.3. Setting the Limits on the System

On Ubuntu, modify the file `/etc/security/limits.conf` and add the line

```conf
*          soft     core            unlimited
*          hard     core            unlimited
```

This sets the default for all users (given by `*`) to create core dumps of
unlimited size.

### 2.4. Why Core Dumps are Disabled

Your operating system vendor often disables core dumps in the release build for
numerous (good) reasons, despite you as a developer being frustrated at the
amount of work to get the core dump of your program while debugging.

* Core dumps slow down the system;
  * When a core dump occurs, the system must wait for the core dump to occur.
    Depending on your I/O subsystem (disk or SSD) and the size of the image
    being dumped (today, machines with 8GB are common, and applications of
    hundreds of megabytes, to gigabytes of size are normal).
* Core dumps take up space;
  * If not cleaned up, you have to hunt down the bugs, for something the user of
    the Operating System generally doesn't care about.
* They may contain sensitive information;
  * The security aspect, badly written programs store passwords in their memory,
    expecting this to be transient. The program crashes, and the passwords are
    now accessible in the core dump. Applications should (but they don't) clear
    memory and mark sensitive pages as non-dumpable.
* Vendors have all the core dumps they already need.
  * For example
    [Ubuntu](https://wiki.ubuntu.com/Apport#Why_is_apport_disabled_by_default.3F)

    > During the development release we already collect thousands of crash
    > reports, much more than we can ever fix. Continuing to collect those for
    > stable releases is not really useful,

There may be more reasons of course

## 3. Piping a Core Dump

The [core](https://man7.org/linux/man-pages/man5/core.5.html) manual describes
an alternative for causing core dumps:

> Since kernel 2.6.19, Linux supports an alternate syntax for the
> `/proc/sys/kernel/core_pattern` file.  If the first character of this file is
> a pipe symbol (`|`), then the remainder of the line is interpreted as the
> command-line for a user-space program (or script) that is to be executed.

### 3.1. Apport on Ubuntu

I'm using an Ubuntu 22.04 desktop system, with with
[Apport](https://wiki.ubuntu.com/Apport) installed. It is configured as a legacy
service.

```sh
root$ service apport restart
```

The commands for dumping are:

```sh
$ sysctl kernel.core_pattern
kernel.core_pattern = |/usr/share/apport/apport -p%p -s%s -c%c -d%d -P%P -u%u -g%g -- %E
$ sysctl fs.suid_dumpable
fs.suid_dumpable = 2
```

When an application generates a signal, the program listed above
`/usr/share/apport/apport` is called and the command line is substituted with
specific parameters.

### 3.2. The Command Line

Repeating what the [core](https://man7.org/linux/man-pages/man5/core.5.html)
says here:

* `%p`  PID of dumped process, as seen in the PID namespace in which the process
  resides.
* `%s`  Number of signal causing dump.
* `%c`  Core file size soft resource limit of crashing process (since Linux
  2.6.24).
* `%d`  Dump mode — same as value returned by
  [prctl(2)](https://man7.org/linux/man-pages/man2/prctl.2.html)
  `PR_GET_DUMPABLE` (since Linux 3.7).
* `%P`  PID of dumped process, as seen in the initial PID namespace (since Linux
  3.12).
* `%u`  Numeric real UID of dumped process.
* `%g`  Numeric real GID of dumped process.
* `%E`  Pathname of executable, with slashes (`/`) replaced by exclamation marks
  (`!`) (since Linux 3.0).

Thus the Ubuntu tool `apport` (which is a python script) gets all the
information it needs about the core dump.

### 3.3. Core Dumps and Output to the User

When a pipe is used on Linux, we now always see

```sh
Aborted (core dumped)
```

So where's the core dump? It's nowhere to be found. The output on the command
line just tells you that a core dump was captured and *the user space program
was started*. There still might not be a core dump, that is now the policy of
the program that was started.

Certainly, and the ability to have much more flexibility in generating a core
dump, we now have to hunt down where the core dump is stored.

### 3.4. Limits Handling for User Space Core Dump Programs

The kernel will now stream the core dump to the user program, that it can read
it from `stdin`. The Kernel doesn't enforce limits when sending the data. This
is up to the user space program to receive the core dump and enforce the limits
with the `%c` parameters.

That means, the current soft limit given back by `ulimit -S -c` for the current
process (or more specifically, if that process also changed or set the limit via
[setrlimit](https://www.man7.org/linux/man-pages/man3/setrlimit.3p.html) or
[prlimit](https://man7.org/linux/man-pages/man2/prlimit.2.html)) is given to the
user space program. It can use or ignore it as required.

I was able to test this very briefly by modifying the command line to always
give `-c-1` instead of `-c%c` to override and always get a core dump.

## 4. Where's my Core Dump on Ubuntu?

In the previous section we've learned how Linux is configured to write a core
dump to the file system, and then how it can be then configured to use a user
program, such as `apport`. Using the `apport`, we don't know any more where that
core dump is written! For this we need to follow up with the documentation for
that program.

### 4.1. User Core Dumps with Apport

When a core dump is created, the program `apport` will write them to the folder

`/var/lib/apport/coredump`

This is just the core dump, you can load this with your favourite debugger, such
as `gdb`. There is no other information captured by `apport` at the time of the
crash.

The logic is defined in `apport` as

```python
    if not apport.fileutils.likely_packaged(info['ExecutablePath']):
        if not apport.fileutils.get_config('main', 'unpackaged', False, bool=True):
            error_log('executable does not belong to a package, ignoring')
            # check if the user wants a core dump
            recover_privileges()
            write_user_coredump(pid, process_start, core_ulimit, coredump_fd)
            sys.exit(0)
```

It calls the function `write_user_coredump` with the rlimits. We can see it
being logged as:

```log
ERROR: apport (pid 3822) Sun Dec 18 11:02:58 2022: called for pid 3821, signal 6, core limit 0, dump mode 1
ERROR: apport (pid 3822) Sun Dec 18 11:02:58 2022: executable: /home/jcurl/source/devc-cpuid/build_lin/test/lib/devc-cpuid-test (command line "./test/lib/devc-cpuid-test")
ERROR: apport (pid 3822) Sun Dec 18 11:02:58 2022: executable does not belong to a package, ignoring
```

In the case given, we see that `core limit 0` says that the `ulimit -S -c` is
zero! So although we were told on the command line that there was a core dump,
in reality, the `apport` program just exited.

### 4.2. Apport User Core Dumps with a Non-zero Limit

If the limit is properly set at the time of the dump, we will see instead:

```log
ERROR: apport (pid 13414) Sun Dec 18 02:13:11 2022: called for pid 13413, signal 6, core limit 18446744073709551615, dump mode 1
ERROR: apport (pid 13414) Sun Dec 18 02:13:11 2022: ignoring implausibly big core limit, treating as unlimited
ERROR: apport (pid 13414) Sun Dec 18 02:13:11 2022: executable: /home/jcurl/source/devc-cpuid/build_lin/test/lib/devc-cpuid-test (command line "./test/lib/devc-cpuid-test")
ERROR: apport (pid 13414) Sun Dec 18 02:13:11 2022: executable does not belong to a package, ignoring
ERROR: apport (pid 13414) Sun Dec 18 02:13:11 2022: writing core dump to core._home_jcurl_source_devc-cpuid_build_lin_test_lib_devc-cpuid-test.923401105.7444b6a1-195c-4a29-a522-c7a02527d9ca.13413.250648 (limit: -1)
```

So now `apport` has written the core dump to the file
`core._home_jcurl_source_devc-cpuid_build_lin_test_lib_devc-cpuid-test.923401105.7444b6a1-195c-4a29-a522-c7a02527d9ca.13413.250648`

This file is stored in the path `/var/lib/apport/coredump`.

### 4.3. Apport Package Core Dumps

When a crash of the application occurs for a system package, information is
gathered, a core dump occurs, regardless of the current limit. It's also very
convenient to capture additional information which saves time when debugging (no
need to open `gdb` in many cases, as the stack trace is sufficient).

If we see this line:

```python
apport.fileutils.get_config('main', 'unpackaged', False, bool=True)
```

this is asking `apport` to treat unpackaged applications as a packaged core
dump. To set this configuration, create the file `~/.config/apport/settings`
with the following content:

```ini
[main]
unpackaged=true
```

A core dump on my machine, when from a few hundred milliseconds to about 1100ms.
There is a lot of extra work going on to generate the core dump and extra
information, now known as a *crash* file.

#### 4.3.1. Location of the Crash File

When the crash occurs, it is placed in `/var/crash`.

```sh
$ ls -l /var/crash
_home_jcurl_source_devc-cpuid_build_lin_test_lib_devc-cpuid-test.923401105.crash
```

#### 4.3.2. Unpacking a Crash File

To get the core dump and other information.

```sh
$ apport-unpack /var/crash/filename.crash mycrash
```

This creates a new folder called `mycrash` and extracts the information there.
The core dump is called `CoreDump` and can be loaded with `gdb`.

#### 4.3.3. Limits for a Crash File

My testing shows that the `ulimit` is ignored. This means that core dumps are
always created when this setting is used. It's convenient, but may be slow and
not easily controllable.

So this might not be suitable for the general use case.

## 5. Further Use Cases

### 5.1. Using an Address Sanitizer

#### 5.1.1. Where's My Core Dump?

I could now generate a core dump with the following use case

```sh
$ sleep 10000 &
$ ps
    PID TTY          TIME CMD
   3888 pts/1    00:00:00 bash
   6109 pts/1    00:00:00 sleep
   6110 pts/1    00:00:00 ps
$ kill -s 11 6109
$
[1]+  Segmentation fault      (core dumped) sleep 10000
```

I could see the core dump in `/var/lib/apport/coredump`

```sh
$ ls /var/lib/apport/coredump
core._usr_bin_sleep.923401105.4ba8a8da-2d40-4a13-b878-11b7de5302be.6109.503274
```

But when I caused my own application to crash, there was no core dump to find,
despite everything being properly configured and tested.

#### 5.1.2. Debugging the Limits

The `ulimit` was correctly showing `unlimited`. But no core dump was being
generated. The tool `apport` reported the limit still be zero with `core limit
0`. I wasn't using the wrong shell.

I could work around the problem as described above using multiple mechanisms:

* Change the command line to

  ```sh
  root$ sysctl -w kernel.core_pattern="|/usr/share/apport/apport -p%p -s%s -c-1 -d%d -P%P -u%u -g%g -- %E"
  ```

* Or create the settings file `~/.config/apport/settings`

But these weren't ideal, workarounds, and we *knew* that wasn't what the
Operating System designers intended.

#### 5.1.3. Analysing the Program

The next step was to see if the program itself was changing the limits. We could
use the `strace` program to help us track this down. And sure enough, in the
output we see:

```log
prlimit64(0, RLIMIT_CORE, NULL, {rlim_cur=RLIM64_INFINITY, rlim_max=RLIM64_INFINITY}) = 0
prlimit64(0, RLIMIT_CORE, {rlim_cur=0, rlim_max=RLIM64_INFINITY}, NULL) = 0
```

We can see the program first reading the limits, and it's confirmed that the
`ulimit` is correct as the results given by the OS is `RLIM64_INFINITY`.

And the next line it was setting the soft limit `rlim_cur` to zero! This is the
reason why the core dumps are being disabled. So it had to do with the
development environment, not the system.

As the software I wrote is configurable, I tried the release version, checking
if this is something a debug option is enabling. Sure enough, running the tests
I could generate a core dump. So something is being linked and changing the
behaviour, as I didn't write the code to set the `prlimit`s.

#### 5.1.4. Root Cause - Address Sanitizer

I was able to narrow it down to turning on and off the usage of the Google
Address Sanitizer with my project. When disabled, I could generate core dumps.
When enabled, no core dump was generated because it was setting the limit.

The solution is to:

```sh
$ ASAN_OPTIONS=abort_on_error=1:disable_coredump=0 myunittest
```

This fixed the problem, and now I also have core dumps for my unit tests,
especially useful when an `assert(false)` occurs.

### 5.2. Sending a SIGKILL

When a core dump is being generated by a user space program, the Kernel keeps
the memory space `/proc/<pid>` for as long as the program is dumping. When the
program finishes, then the PID is removed from the name space.

If a `SIGKILL` is sent to the PID before the dumping is finished, this will
cause the Linux Kernel to immediately stop the dumping and to clean up. So if
your core dump appears incomplete, make sure no-one sends a `SIGKILL` to the PID
that is currently dumping.
