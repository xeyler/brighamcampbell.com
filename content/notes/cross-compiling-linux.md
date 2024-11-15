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

![GNU target triplet](/tex/gnu-triplet.svg)

The CPU field indicates the platform's processor architecture. The vendor field
indicates the entity that distributes software for the platform (this field is
commonly "`unknown`" on Linux). The kernel field indicates the kernel that
supports the platform.

In practice, there are many cases in which a target triplet is neither a unique
descriptor of a target nor a triplet at all. Sometimes, the triplet can have an
additional field for the application binary interface (ABI), as in
`arm‑none‑linux‑gnueabi`. On some platforms, the vendor field is omitted, as in
`x86_64‑linux-gnu`. On other platforms, the kernel field is omitted. Therefore,
the target triplet is only useful after disambiguation, which is the sole
purpose of `config.sub`, a subroutine of the GNU build system[^3].

Linux is an application which runs in a freestanding environment, where an
application has access to only a very small portion of the C standard library,
as opposed to a hosted environment, where an application is guaranteed to have
access to the entire C standard library. The interface a freestanding
environment exposes to an application is a subset of that of a hosted
environment:

![freestanding as a subset of hosted](/tex/freestanding-hosted-environments.svg)

This is why the Linux kernel, which only takes advantage of the capabilities of
a freestanding environment, can be compiled with either a compiler that targets
a freestanding environment (e.g. `aarch64‑none‑eabi`) or one that targets a
hosted environment (e.g. `aarch64‑unknown‑linux‑gnueabi`).

# The cross compiler

Now that we have uniquely identified the target platforms, we need to acquire
the correct cross compiler. There are a couple different ways to do this:

* Manually build a cross compiler using a native compiler and the GCC source
  code
* Install a pre-built cross compiler from your distribution's package
  repository
* Use toolchain management software like crosstool-NG or buildroot to build a
  custom cross compiler toolchain

We'll opt to build a gcc toolchain which targets a freestanding environment
using crosstool-NG.

# Crosstool-NG

Crosstool-NG can be built and installed from source, downloaded as a tarball, or
installed from some distributions' package repositories[^4]. 

# Compiling the kernel

# Using QEMU to test the kernel

[^1]: See Linux From Scratch
    (https://www.linuxfromscratch.org/lfs/view/stable/part3.html)
[^2]: Use `gcc -dumpmachine` to view your own system's target triplet.
[^3]: See the complete gcc source code (https://gcc.gnu.org/releases.html) or
    config.sub on the GitHub mirror
    (https://github.com/gcc-mirror/gcc/blob/master/config.sub)
[^4]: See crosstool-NG installation instructions
    (https://crosstool-ng.github.io/docs/install/)