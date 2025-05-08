+++
title = 'I Use IRC and You Should Too'
date = 2025-05-07T13:10:01-07:00
+++

I disliked communicating via IRC since the very first time I tried it. I found many of the commands and different bots are counter-intuitive, there's no support for file sharing or multimedia, and despite being the preferred method of communication of many open source experts, I found it difficult to receive an answer to my questions in _any_ channel, and I found the lack of chat history frustrating.

It turns out I was wrong. The strange design decisions of IRC are actually its greatest strengths. Here are some tips I wish I knew long ago:

# 1. Context isn't key

Platforms like Discord and Slack make it easy to catch up on conversations you may have missed while you were away from the keyboard. They record a comprehensive history of each channel for you to view at your leisure. On paper, this may seem like a nice feature, but it inspires an anxiety that while your messaging platform of choice is saving every single message that's sent while you're gone, you are falling behind bit by bit. Using Discord, I found myself obsessively checking channels not because I thought there may have been an interesting conversation there, but simply because there was a notification indicating unread messages.

When you use IRC, you are not expected to read every message in a channel. That's an intentional feature. If another user wants you to read something, they will mention you. Everything else is intentionally ephemeral. If you'd like to maintain logs of a channel while you're offline, use a bouncer to stay connected!

On the topic of bouncers, most users are going to want to use a service like [IRCCloud](https://www.irccloud.com/pricing) or [IRC Today](https://irctoday.com/pricing). Both have free plans with enough features to get started with IRC and fairly-priced paid plans for those who outgrow the free tier. Superusers and sysadmins may be interested in self-hosting a bouncer. Of the hundreds of options out there, I recommend [soju](https://soju.im/). It supports a wide array of experimental IRCv3 features which make IRC more user friendly and is actively maintained by a great community. It took me about a half hour to set up soju in a Docker container and I've been using it without issue since then.

# 2. Getting answers

As it turns out, setting up a bouncer is likely the best thing you can do if IRC channels seem abandoned and you have difficulty getting responses to your questions. On many channels, it could take up to a couple hours to receive a response. That may seem grueling, but after you've used IRC for a while, you'll find waiting preferable to firehose channels like Libera Chat's #archlinux, trust me.

Asynchronous chat encourages precision in asking and answering questions. Precision gets the solution you're looking for.

I'll be the first to admit that I still ask questions which could be better and I don't always get the helpful response I'm looking for, but if users seem to ignore or misunderstand your questions, [ask better questions](http://www.catb.org/esr/faqs/smart-questions.html).

# 3. Text-based chat is better

Modern messaging platforms make it easy to share images, videos, audio recordings, and all sorts of media. IRC, on the other hand, is entirely text-based. It may seem backwards to communicate exclusively via text, but there are good reasons to prefer text-based communication: text is by far the most accessible communication medium on the internet, and text is much easier to search than any other type of media.

For those with accessibility needs, text can be read aloud with screen readers, output to braille touch devices, automatically translated to and from a native language, and a hundred other things.

When want to recall a message that was sent a while ago, I can use my client to search for exact string matches or regular expressions. Unfortunately, my client of choice doesn't seem to allow searching for messages sent by a specific user quite yet, but most channels I participate in are slow enough that I haven't found myself wishing I had that feature quite yet. I'm happier knowing that chat logs are stored on and searchable from a computer that I own instead of the cloud.

For cases in which text just isn't sufficient, use a pastebin like [0x0.st](https://0x0.st) to send files. And if it's important to you, use a client which supports file previews and embedded media like The Lounge.

# 4. Commands and bots

The commands you use and specific bots you interact with on IRC will depend in part on the client you use, the bouncer you use (if applicable), the network you're connected to, and even the channel you're in at any given time. Rather than concerning yourself with learning what every command does and how each bot works, you should start with the basics.

Learn how to register a username (or "nick") with NickServ. If the IRC network you're connecting to supports it, try authenticating via SASL so that you don't need to enter a passphrase each time you connect. Try using `/msg <nick> <message>` to privately message someone. Use [netsplit.de](https://netsplit.de) to find popular channels which interest you. If the IRC network has a website, check to see if they have a page on basic information that you should know as a user.

# Conclusion

I've enjoyed learning to use IRC and I've found that the kinds of people and project communities that prefer to communicate via IRC are interesting, helpful, and fun to participate with. For example, after asking on the official Buildroot IRC channel about strange behavior while using Buildroot, I was promptly instructed to apply a patch from the mailing list which fixed a recent bug between m4 and gcc. This led to my [first small contribution](https://lore.kernel.org/buildroot/D9OYJGBFLUT8.35SXNUQLMD2TR@brighamcampbell.com/) to the Buildroot mailing list. I've already had several positive experiences like this one and it makes participating in open source software even more enjoyable.

If you connect to the OFTC or Libera Chat networks, reach out. My nick is `xeyler`.
