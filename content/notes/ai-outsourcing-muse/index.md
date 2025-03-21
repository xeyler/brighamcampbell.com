+++
title = 'On AI and Code: Outsourcing Muse'
date = 2025-02-23T13:10:01-07:00
+++

I spend a lot of time thinking about problems and solutions. Most of the time,
I'm just stumped. Unfortunately, I was never really a programming prodigy. I
didn't start programming when I was 5. I've never "dreamt in code". In most
science, engineering, and math contexts, I'm slower than my peers.

I've learned not to let these facts bother me. After all, if you've solved
every problem you've ever tried to solve, maybe you should be working on
harder problems. Time is the only fundamental scarcity. General consensus
says the fact that time is scarce is good reason to be paranoid about how
you spend your time. I assert the opposite: The simple act of _spending time_
is just as important and expressive as what you might do _during that time_.

For a long period of time about a decade ago, I considered how to generate
mazes of any size programmatically. I remember thinking about possible
solutions for days. I tried a couple ideas in Java and never quite got the
results I wanted. This problem haunted me... until I simply moved on. It
bested me.

I wonder, if AI had been developed a decade ago, could it have helped
me come closer to a solution? The resounding answer from OpenAI, Google,
GitHub, Facebook, Nvidia, Elon Musk and friends is, "Yes! AI can help you
code better! Our digital assistant can make you 137% more efficient![^1]"
It's only natural that they would want the rest of us to be excited about AI,
considering their stake in the technology.

## Efficiency

Let's assume that AI _can_, in fact, help me write code of a higher
quality in less time than I could alone. Completeness and quality are always
good. Efficiency sounds nice, but is it really all that important? After all,
not all those who wander are lost. Even if AI lives up to the futuristic
promises, is it worth the cost?

AI is often criticized for frequently giving wrong answers. In my own
experience, this is absolutely true, but can we really blame it for that? After
all, I've heard professors, co-workers, and peers make deeply incorrect claims
in the same authoritative voice that AI perpetually writes in. Maybe it's
especially frustrating when AI does it because we expect cold, hard computers
to be precise and exact, but there are more convincing arguments against AI:

* **AI training datasets are unregulated by legislature**

    Thanks especially to the advent of the world wide web, it's impossible
    for AI training datasets to be regulated. Models are trained by
    analyzing a gigantic corpus of text (i.e. the entire web as we know
    it). Thanks to the open nature of the web, most information can be
    scraped automatically. There's no way of knowing whether or not a post
    you created has ever been or ever will be used to train AI.

    Services like [Have I Been Trained](https://haveibeentrained.com/) may
    be used to prove that your data appears in an AI training dataset, but
    more needs to be done: It can't prove that your data _doesn't_ appear
    in an AI training dataset. Have I Been Trained also allows users to
    opt out of allowing their data to be used to train AI, but in practice,
    nobody actually respects this registry. In the age of AI, your data is
    not longer yours.

* **AI training and usage contributes to carbon emissions**

    The process of training an AI takes a huge amount of computational
    power. In order to produce their latest model, Grok v3, xAI constructed
    a supercomputer in Memphis. Ever since the data center's electrical
    consumption surpassed the limits of the Memphis power grid, xAI has
    been using methane gas turbines to fuel their supercomputer. Apparently,
    xAI intends to use these mobile generators 24/7 permanently.[^2]

    Then there are the unpredictable higher-order effects of AI on the
    environment: Are "anti-woke" AI models like Grok going to impact a large
    number of people's views on global warming? Is the broader availability of
    AI-driven cars going to cause fewer people to use public transit? There's
    no way of knowing until it happens.

* **AI scraperbots are DDoSing the internet**

    Since the beginning, the web was meant to be a place where anyone
    could publish their own content, or invent a new service and make it
    available. It's as simple as registering a domain, setting up a server
    daemon, and opening a port on your firewall.

    Before search engines like Google, the web was a nebulous,
    loosely-connected network of documents. Search engines unify the internet
    by scraping the entire web and indexing its contents. robots.txt exists
    to inform web scrapers how to index a website.

    Since the advent of AI, however, scrapers are no longer interested in
    indexing websites. They're interested in downloading the entire contents of
    every website, to be heaped onto the churning pile of computation that is
    to produce the latest LLM. These scrapers do not respect robots.txt. The
    copious amounts of traffic they generate make it even more difficult
    to host a public-facing service, thus challenging the open nature of
    the web.[^3]

## _Real_ Intelligence

Unlike the bots', our intelligence isn't artificial. We're perfectly capable
of finding answers to our own questions and reaching out to each other when
we need help. I'm going to try to seek out my own experience and information
more, instead of relying on AI. It's just not worth the costs of outsourcing
such a deeply creative labor to math and carbon.

A decade after puzzling over maze generation algorithms, I finally implemented
one in Python[^4]. It was written entirely by myself, in an effort to answer
a question I had.

[![maze generator output](/img/python-maze-gen.png)](maze.py)

[^1]: Motion, an AI secretary, made this claim when I accessed their homepage
February 20, 2025. Your guess as to how their marketing team came up with 137%
is as good as mine...

[^2]: See
https://www.southernenvironment.org/news/elon-musks-xai-facility-is-polluting-south-memphis/

[^3]: See https://lwn.net/Articles/1008897/

[^4]: See the source [here](maze.py)
