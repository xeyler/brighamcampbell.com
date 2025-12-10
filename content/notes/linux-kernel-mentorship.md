+++
title = 'Becoming a Kernel Developer (Hire Me!)'
date = 2025-12-09T22:53:46-07:00
draft = true
+++

Linux kernel developers are famously abrasive, irritable, and explosive. Or
that's what pop culture would have you believe, anyways. In my personal
experience, I've found professional kernel developers to be very kind. They
care deeply about the quality of the code they maintain. If you try your best
to avoid simple mistakes when you communicate with them, they will often
consider your contribution carefully and respectfully.

In communication with Greg KH, Jason Donenfield spoke well when he said the
following about kernel development:

```
<zx2c4> I think the reason it works is not necessarily because
<zx2c4> the responses are so terrific
<zx2c4> but because
<zx2c4> they are TERRIFYING
<zx2c4> so i'm forced to do my best possible work
```

Kernel work is terrifying because it requires you to put your work out into
public mailing lists for all to see. Despite that, any work that is worth your
time is worth doing openly for anyone to critique, test, and improve. The open
nature of kernel work is terrifying because nobody likes to fall flat on their
face in front of experts, but the opportunity for collaboration and the quality
of feedback is terrific. It's terrifyingly terrific, one might say.

I recently had the opportunity to work with some of these kernel developers and
receive this kind of feedback by participating in the Linux Kernel Mentorship
Program put on by Shuah Khan at the Linux Foundation. Over the past couple
months, I've communicated with professional kernel developers to make careful
improvements to the Linux kernel. I've collaborated with them and acted on
their feedback to meet the requirements of the kernel. I've met with
professionals in person and via Zoom to learn more from them.

## Setting Out

In the process of applying to the mentorship, I sent out [my first
patch](https://lore.kernel.org/all/20250528054146.2658537-2-me@brighamcampbell.com/)
, a small change to kernel documentation to address a compilation warning. I
was excited to get an email from Jonathan Corbet a couple days later letting me
know he applied the patch.

Afterwards, I felt excited to have officially made a useful (albeit small)
change in the kernel repository, but I was unsure where to go from there.
Eventually, I decided to do what I recommend anyone interested in contributing
to the kernel do: I read the code and documentation, looking for TODO items.
When active kernel developers are looking for help, sometimes they write down
an invitation for help in the kernel documentation. That invitation is a strong
indication that they are willing to work with someone who may not be an expert,
but who is willing to do their best.

I selected one of the easier TODO items from the [DRM subsystem
documentation](https://docs.kernel.org/gpu/todo.html), cloned the DRM git tree,
and got to work. At length, I submitted a patch to clean up deprecated API
calls in a display panel driver. Doug Anderson and other kernel maintainers
gave very thorough and patient feedback. After communicating with developers
and submitting several different revisions, Doug eventually applied my changes
upstream. He gave the [following
feedback](https://lore.kernel.org/all/CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com/)
on the final revision of my changes, which I thought was especially cool:

```
Just because I was curious and wanted to confirm my claim that this
would result in a nice space savings for novatek, I ran bloat-o-meter
on the novatek module comparing before and after your patch:

add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
Function                                     old     new   delta
elish_csot_init_sequence.d                   758     379    -379
elish_boe_init_sequence.d                    846     423    -423
elish_csot_init_sequence                    9136    5380   -3756
elish_boe_init_sequence                    10192    5996   -4196
Total: Before=33880, After=25126, chg -25.84%

So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
indeed give a pretty sweet space savings! :-)

This patch looks good to me now. Thanks for putting up with all my
requests. I know this is a lot bigger than you thought it would be
when you posted your first patch, but I appreciate you sticking with
it!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
```

Afterwards, I continued to work with Doug and other kernel developers to make
other meaningful changes to the kernel. In a couple weeks, I had authored 11
patches which made their way upstream.

## What's Next?

![hat](/img/rpi-mipi-hat.png)

Right now, I'm working on developing and testing changes to the
`panel-mipi-dbi` driver, a generic driver for MIPI displays. Using KiCad, I
created a Raspberry Pi hat for a small MIPI display. As I tested the driver
with the most current kernel code, I realized that a regression in the
Raspberry Pi's kernel is causing the driver to crash upon boot. In general, the
Raspberry Pi is very stable, but it has many patches on top of the upstream
kernel which make the very latest version of the Linux kernel break now and
then.

In order to test whether the breakage occured upstream or somewhere in the
patches applied to the Raspberry Pi's custom Linux kernel specifically, I
created a hat to test the same display with a the Beaglebone Black. The PCB is
on its way to me now in the mail.

After I get the display working with the latest kernel code, I expect to send
out some cleanup patches for the driver to the mailing list. Until then, I will
remain active on the mailing lists by reviewing patches which touch code that I
have changed.

## Hire Me!

I'm interested in working on the kernel professionally. To learn more about my
involvement in the kernel, see the upstream [commits I've
authored](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=author&q=Brigham+Campbell).
I have professional experience with Yocto, Buildroot, Xilinx's PetaLinux, C,
and C++. I have used Linux for years and am skilled in low-level and embedded
systems software engineering. See [my
resume](https://brighamcampbell.com/resume.pdf). I look forward to hearing from
you!
