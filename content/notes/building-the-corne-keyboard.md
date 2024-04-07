---
title: Building the Corne (Helidox) Keyboard

summary: >-
date: 2024-04-07
  
tags: [corne,crkbd,foostan,qmk,custom keyboard,split keyboard]
---

The past couple months have been very... unique... Especially for those of us
that live in the United States (to anyone living outside the U.S., sorry about
the whole COVID-19 thing... We seriously dropped the ball on that one)!
Although, I have to admit that it hasn't _entirely_ been a waste:

I figured that if I was going to distance myself socially for a couple months,
I might as well have a good reason. That's where the corne keyboard comes in!
After all, if you're the type of person to build your own keyboard from
scratch, you're probably also the type of person who avoids social interaction
even when there aren't any viruses running rampant.

The Corne is a split keyboard with only 42 keys total. {% include
post/link.html url="https://github.com/foostan" text="Kosuke Adachi (@foostan)"
%}, a self-made keyboard enthusiast and software engineer from Japan, designed
the keyboard from the ground up. The keyboard looks something like this when
it's assembled by an absolute pro:

{% include post/img-figure.html
	url="/assets/img/corne/completed-corne-on-desk.jpg"
	caption="What? My desk is always this tidy..."
	alt="Corne keyboard on a desk, connected to a computer"
%}

## Collecting the Pieces

After weeks of convincing myself that I wouldn't irreparably screw up the
build and that I wouldn't accidentally hate typing on the keyboard once I
finished it, I finally began hunting down the parts I needed. Eventually, the
receipts piled up into a collection somewhat resembling the following:

| PCBs                                     | $59.95  |
| TRRS Cables                              |  $8.15  |
| MX Brown Switches                        | $21.84  |
| Mill-Max Pins                            | $33.47  |
| Pro Micros, OLED screens, diodes, etc... | $48.07  |
| Acrylic sheets                           | $32.10  |
| *Total*{: style="float: right;"}         | $203.58 |

Yeah, you read that right: $203.58 and hours of work for the keyboard. However,
I could have cut costs considerably (at least by 20%) if I had opted for more
patient shipping. And in an effort to make the build cheaper in the long run, I
ordered twice as many parts as I needed. By this method, I could build two
keyboards and sell one online! I figured if I was lucky, I might be able to
break even. However, that was before a couple mishaps...

After the parts started trickling in from the mail, I realized I still needed
to order the plates which would sandwich the PCB and stabilize the switches.
Rather than order them online, I figured I'd buy a sheet of plexiglass and get
it laser-cut at my university's "maker shop". 

Innocent enough.

After I got a $15 sheet of plexiglass, I took it to the shop, slapped it in the
cutter, loaded up the vector file, and set the cutter to do its thing. Shortly
thereafter, the plexiglass burst into flames! Apparently, there are very
important differences between acrylic and plexiglass. One such difference is
that plexiglass is much more likely to burn.

Okay, no big deal... Just go grab some acrylic.

Another $15 dollars later, I hiked back to the shop with an *acrylic* sheet in
tow. This time, the cutter lased away without complaint. When it was finished,
I inspected the new pieces and packed them up, satisfied. But later, after I
began (gently, mind you) wiping them down with isopropyl to remove some faint
traces of smoke, they immediately fractured! Foiled again!

At that point, I finally decided to fork over another $14 dollars + priority
shipping for PCB plates and toss the acrylic. The project was, albeit
expensively, back on track! And after a week or so of waiting, I finally had
collected all the pieces!

## Assembly!

{% include post/img-figure.html
	url="/assets/img/corne/corne-assembly.jpg"
	caption="Sorry about stealing the coffee table, roommates..."
	alt="Corne parts on coffee table"
%}

Honestly, sourcing the all the parts was probably the most difficult part of
the build. Once I had the pieces, the assembly was a snap! 

I started with the diodes. Each joint got a little flux and a touch of solder
before I slapped on a diode. After a couple minutes of that, I moved onto the
other side and very nearly soldered every diode backwards! Thank goodness I
checked the first one...

After dodging that bullet, I moved to the Pro Micros and OLED displays. I had
decided to socket them in case I want to swap them out in the future.
Naturally, that meant more work for me, but nothing I couldn't handle!
Although, whoever designed the Pro Micro seriously wasn't joking when they made
each hole for the pins a mile in diameter. I might have had an easier time
filling the gaps with a cement truck full of molten solder than I did with my
humble soldering iron.

When I had finished on the Pro Micros, displays, and a couple small SMT
components, it was finally time to solder the actual switches! This was mostly
straightforward as well. I just popped the switches into the top plate, lined
up the contacts, and soldered away!

Some flux, solder, and "lo-fi beats to chill to" later, it was complete! I
hooked up the halves with a TRRS cable, plugged it into my PC, and got to work
figuring out how to actually use it.

## Thoughts/Plans

After spending some time with the Corne, I can conclusively say that I like it
even more than I expected I would! A lot of thought was put into the design of
the little keyboard and that's reflected directly in the feel! Somehow, it
feels almost like playing a piano. Maybe it's because more of the work has
shifted to the thumbs? Or maybe it's just that I'm just as bad at figuring out
where the tilde key is as I am at playing the piano? Whatever it is, I like it!

One of the many things this project helped me learn more about was QMK. It's an
open source framework for creating firmware for keyboards. It allows users to
easily customize some fairly low-level stuff (for example, the Corne usually
only works when you plug the left side into your computer, but I was able to
quickly configure the firmware to allow the user to plug in either side!)
without the sweat of navigating some intimidating C codebase! I haven't looked
into QMK extensively, but from what I've seen it's hands-down one of the
best-documented open source projects I've seen. Go {% include post/link.html
url="https://qmk.fm" text="take a look for yourself" %}!

Naturally, I've changed the keymap a little from the default. There are still
some strange quirks about the mapping and I'll definitely be dialing it in to
suit my needs. If I ever do get it exactly how I'd like it to be, I'll be sure
to update this post with the mapping. For now, we'll call it "in development".

Finally, I've thought it could be interesting to squeeze a little more out of
the little Pro Micros. **In theory**, it shouldn't be difficult to write some
code which would store the total number of keystrokes in EEPROM. A couple
sprites to display on the OLED screens later, and you've got a keyboard
tamagotchi! For now, I have this idea tucked away among a large collection of
things I want to try. I'll let you know if I ever get around to it!

Until then, a sincere "thank you" to Kosuke Adachi for making such a cool
keyboard and to you, reader! If you've made it this far, {% include
post/link.html url="https://twitter.com/intent/tweet?screen_name=Xeyler"
text="shoot me a message on Twitter" %}. I'd like to hear about the things
you've been working on. ❤️