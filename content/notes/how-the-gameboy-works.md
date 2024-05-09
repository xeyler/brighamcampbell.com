+++
title = 'Inside the Nintendo Gameboy'
date = 2024-04-17T10:37:29-06:00
draft = true
+++

I grew up in the early 2000s. It was a different time: corduroy overalls,
drinking from garden hoses, Rock 'Em Sock 'Em Robots, AA batteries, Spongebob on
Saturdays, and playing in the dirt. When I think back to that time, I remember a
specific visit to Grandma's house. I had found an old, beige Gameboy in a box of
Aunt Em's old stuff.

Apparently, the only game Em had was The Lion King. As far as Gameboy games go,
The Lion King actually had some pretty baller graphics. Not that I experienced
much of the game's graphics, of course... I spent that entire afternoon trying
to get past one level.

Since my first time playing that Gameboy, I've become interested in how
computers work. Coincidentally, the Gameboy has a lot to teach about classic
computer architecture. Modern computers are much faster than the Gameboy, but
the fundamental principles behind their architecture and operation remain the
same.

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
internal state (a bunch of registered, labeled A-E, among others), and memory.

You can think of memory as a bunch of mailboxes on a street, roughly. Let's call
this street "Memory Lane". On Memory Lane, each mailbox has its own address and
contents, exactly one byte in length. In this analogy, the Gameboy's CPU could
be compared to a mailman that goes to mailboxes, reading or overwriting the
contents of boxes.

When you flip the switch on the Gameboy, the CPU starts at a specific location
on Memory Lane (address `0x0100`, to be precise). It reads the contents of
mailbox `0x0100` and interprets the byte as an instruction. Once it has finished
executing the instruction, it will move onto the neighboring mailbox to fetch
the next instruction, making it's way down Memory Lane.

## Machine code: byte-sized instructions

How exactly does the Gameboy interpret bytes as instructions, then?

Well, there's [a map](https://gbdev.io/gb-opcodes/optables/) built into the
Gameboy CPU that maps seemingly meaningless byte values to instructions for the
CPU to perform. This map makes hundreds of instructions available to the
programmer. Among the more interesting mapped instructions are the following, in
no particular order:

`0x3C`: Increment the value in register 'A' by one.

`0x80`: Add the value of register 'B' to register 'A' and store the result in
register 'A'

`0x3E`: Take the value from the next mailbox and store it in register 'A'

`0xC3`: Instead of moving to the next mailbox in line, read an address from the
next two mailboxes and "jump" to the mailbox at that address, continuing
execution from there.

`0xF3`: Disable interrupts, which are triggered by certain hardware events such
as button input or bytes received from another Gameboy via link cable.

`0xFB`: Enable interrupts.

All Gameboy games are a combination of thousands of these instructions, a bunch
of bytes stored in a Gameboy cartridge.

## I/O

Now we can use machine code to create programs for the Gameboy CPU, but how do
games actually read input from the buttons and display output to the screen?

The answer is that the CPU, Memory Lane's mailman, isn't the only "resident" of
Memory Lane. The CPU may read and write bytes from mailboxes. Most mailboxes'
contents remain unchanged until the CPU changes them, but many mailboxes also
have residents which are constantly reading and writing the contents.

For example, the mailbox at address `0xFF00` contains the state of the Gameboy
buttons. The upper 4 bits of that byte are set by the CPU and the lower 4 bits
are set by the Gameboy hardware.

First, the CPU sets the 6th bit if it wants to read the A, B, Select, and Start
buttons or it sets the 5th bit if it wants to read the D-pad. Then the Gameboy
hardware sets the [respective bits](https://gbdev.io/pandocs/Joypad_Input.html)
to `0` if the corresponding button is pressed or `1` if they aren't pressed. The
CPU can then read from the mailbox again to get the state of the buttons.

All the peripherals on the Gameboy are controlled similarly, by reading and/or
writing the contents of one or more memory addresses.

## Conclusion

The architecture principles behind having a CPU attached to a memory bus,
co-existing and co-operating with memory-mapped I/O are not unique to the
Gameboy. In fact, the computer that you're more than likely using to read this
article works in exactly the same way.

In the 35 years since the Gameboy was released, these computer architecture
principles haven't changed. After all, if it ain't broke, don't fix it.

If you've read this far, you'll be interested to know that the Gameboy
modding/homebrew scene is very active. Probably more so at the time of this
writing than ever before. See [here](https://gbdev.io/) for more info on the
Gameboy hardware and homebrew community. See
[here](https://www.youtube.com/playlist?list=PLu3xpmdUP-GRDp8tknpXC_Y4RUQtMMqEu)
for a more visual explanation on the inner workings of Gameboys.
