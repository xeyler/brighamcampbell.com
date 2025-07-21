+++
title = "Exec Nonsense"
date = 2025-07-08T22:42:25-06:00
draft = true
+++

> "As a dog returneth to his vomit, so a fool returneth to his exec()" -- God,
> probably

`exec()`, `system()`, and their many variants can be used to run commands from
within a systems programming language like C. Lazy programmers like using them
in lieu of learning how to use their language's standard library or how to add
a software library as a dependency to their build system.

Don't get me wrong, there may very well be a time and a place for `exec()`, but
not nearly as much as I have seen it used as a professional writer of code.
Here are a couple reasons why:

# Stringly Typed Code

Let's say you want to write an application which fetches a list of domains from
a document stored on my web server and print out my site's domains contained in
the document. A lazy approach might look something like the following:

```c
system(
    "curl 'https://brighamcampbell.com/domains.txt' | "
    "grep brighamcampbell.com"
);
```

The problem with this approach is that we're using `system()` to change context
from the C language to some unspecified shell language. Shell languages, like
any other language, have rules, syntax, and idioms. In this context, however,
we're using the shell via stringly typed commands. These strings have no
meaning until a shell spawns processes to run the commands, which effectively
promotes what could have been compile-time errors to runtime errors.

That's not to say that runtime errors are intolerable, but it does defeat the
purpose of using a statically typed, compiled language in the first place. Keep
your application logic in your programming language.

# Ambiguous Dependencies

Now let's consider unmounting a drive. Instead of using the umount function built
into the C standard library, you use the following:

```c
exec(
    "umount --all-targets /dev/hdd0"
);
```

Part of the problem with this approach is that your application is now
dependent on `umount` being present on the host system. That software
dependency isn't tracked by your build system. It's tucked away in some far
corner of your code.

You may argue that you should be able to expect coreutils to be installed on
any system that hosts the application, but that requires that you needlessly
couple your application to Linux machines. And you may not even expect it, but
in using `--all-targets`, your application can now only be run on GNU variants
of Linux distributions. Busybox doesn't support `--all-targets` and has no
reason to do so.

I spent some time debugging this particular problem on an embedded system at
work. I was not impressed when I saw the code.

# Lack of Error Handling

Most languages have error handling primitives and constructs built-in. C
predates good error handling, but libraries cope with that by integrating
structs and callbacks to communicate error states.

In userspace, an application can output text to stdout, stderr, and manipulate
its exit status to indicate that an error occurred. However, in most cases,
these interfaces aren't nearly stable enough to learn what type of error
occurred or what caused it. Text parsing is fragile. Exit status numbers
change.

When you use `exec()`, you sacrifice almost all control over your ability to
recover from an error and pray that it all works out.

# Conclusion

The cost of `exec()` is simply not worth it. `exec()` sacrifices code typing,
documented dependency, and error handling.  Learn your standard library. Learn
your build system. Learn to write better code. Anything else is inexcusable.
