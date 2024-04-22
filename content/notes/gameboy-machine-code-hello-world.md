+++
title = 'Gameboy Machine Code Hello World'
date = 2024-04-17T10:37:29-06:00
draft = true
+++

I grew up in the early 2000s. It was a different time: corduroy overalls,
drinking from garden hoses, Rock 'Em Sock 'Em Robots, AA batteries, Spongebob on
Saturdays, and playing in the dirt. When I think back to that time, I remember a
specific visit to Grandma's house. I had found an old, beige Gameboy in a box of
Aunt Em's old stuff.

Apparently, the only game Em had was The Lion King. As far as Gameboy games go,
The Lion King actually had some pretty baller graphics. Not that I would know,
of course... I spent that entire afternoon trying to get past one level.

Since my first time playing that Gameboy, I've learned a lot more about how they
work. Along the way, I got kind of involved with the Gameboy homebrew community
(which is still surprisingly active, despite the Gameboy's age). An interesting
discussion that I heard now and then was whether C was low-level enough to be
useful for Gameboy development. Gameboy developers sat in one of two camps: C or
assembly.

I was a little more deviant. When I wrote a simple "hello world" program for the
Gameboy, I opted to program it directly in machine code with a hex editor.

## Bytes all the way down

Where computers are concerned, absolutely all information is quantifiable, or
discrete. That is to say, computers speak ones and zeroes and nothing else. Most
of us know this, but don't really understand it. When you learn how to count
whole numbers in binary, it almost starts to make sense, but then how do
computers represent irrational numbers?

The short answer is that [they
can't](https://stackoverflow.com/questions/588004/is-floating-point-math-broken),
so stop worrying about it. Don't let irrational numbers dominate your life. Your
smartphone certainly doesn't.

Anyways, information exists in computers as an ordered sequence bits, which
constitute and ordered sequence of bytes. In the case of the Gameboy, each byte
is either a CPU instruction or data.

## Memory

But how does a Gameboy determine whether a specific byte is an instruction or
data?

The same way that you know what homonyms like "bass" mean. See, "bass" can refer
to either a fish or a musical instrument. You and I use context clues to
differentiate the two. Similarly, a Gameboy knows if a byte is an instruction
depending on context. The context within a Gameboy is made up of the CPU's
internal state (a bunch of labeled registers), and memory.

You can think of memory as a bunch of mailboxes on a street, roughly. Let's call
this street "Memory Lane". On Memory Lane, each mailbox has its own address and
contents, exactly one byte in length. In this analogy, the Gameboy's CPU could
be compared to a mailman that goes to mailboxes, reading or overwriting the
contents of boxes.

When you flip the switch on the Gameboy, the CPU starts at a specific location
on Memory Lane (address `0x0100`, to be precise). It reads the contents of
mailbox `0x0100` and interprets the byte as an instruction. Once it has finished
executing the instruction, it will move onto the neighboring mailbox to fetch
the next instruction.

## Machine code: byte-sized instructions

How exactly does the Gameboy interpret bytes as instructions, then? Well,
there's [a map](https://gbdev.io/gb-opcodes/optables/) built into the Gameboy
CPU that maps seemingly meaningless byte values to instructions for the CPU to
perform. Among the more interesting entries in this instruction map are the
following:

`0xF3` => "Disable all hardware interrupts"

`0xC3` => "Read an address from the next two 'mailboxes' and jump to that
the 'mailbox' at that address"

`0xFA` => "Read an address from the next to 'mailboxes' and load the byte inside
the mailbox at that address into register 'A'

## Putting it all together
