+++
title = 'Cross Compiling the Linux Kernel'
date = 2024-10-03T15:54:12-06:00
draft = true
+++

You want to compile Linux to run on a system which, for some reason or other,
cannot compile its own kernel. Cross-compilation is an appropriate solution to
this problem.

Getting Linux running on embedded systems by using a non-embedded host system to
compile a kernel is a common use-case for cross-compilation. Cross-compilation
is also useful for bootstrapping brand-new Linux distributions, where the host
and target system architectures are the same, but compiled software must not
link against the host system's libraries[^1].

Let's assume that we want to use a computer with a 64-bit x86 processor to
compile Linux for a computer with a 64-bit ARM processor.

# The GNU target triplet

The first step in cross-compilation is to define the target platform. The target
triplet uniquely identifies a platform which gcc (and more generally, the GNU
build system) targets. It looks something like the following[^2]:

![GNU target triplet](/tex/darkmode-compatible/gnu-triplet.svg)

The CPU field indicates the platform's processor architecture. The vendor field indicates
the entity that distributes software for the platform (this field is commonly
`unknown` on Linux). The kernel field indicates the kernel that supports the platform.

In practice, there are many cases in which a target triplet is neither a unique
descriptor of a target nor a triplet at all. Sometimes, triplet can have an
additional field for the application binary interface (ABI), as in
`arm‑none‑linux‑gnueabi`. On some platforms, the vendor field is omitted, as in
`x86_64‑linux-gnu`. On other platforms, the kernel field is omitted. Therefore,
the target triplet is only useful after disambiguation, which is the sole
purpose of `config.sub`, a subroutine of the GNU build system[^3].

Each of the CPU, vendor, kernel, and application binary interface is important
to know before we can successfully compile software for a different platform.

# Bootstrapping a cross compiler

[^1]: See Linux From Scratch:
    https://www.linuxfromscratch.org/lfs/view/stable/part3.html
[^2]: Use `gcc -dumpmachine` to view your own system's target triplet.
[^3]: See https://gcc.gnu.org/releases.html or
    https://github.com/gcc-mirror/gcc/blob/master/config.sub