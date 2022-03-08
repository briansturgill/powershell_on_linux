# My Linux Shell Research

I very much believe that the bourne shell and friends on Linux is very outdated and very
hard for beginners to program in. This led me to many places....

## The current winner: PowerShell
1) Open source: [https://github.com/powershell/powershell]
2) Available on all major platforms. (I.E. Windows and MacOS, as well as Linux)
3) Fully featured and polished.
4) Easily extensible.

## Runner Up
This isn't really quite there yet, but it looks like a good attempt.
### Rust shell with object pipelines
https://www.nushell.sh/

## Serious attempts at a new sort of shell, but without object pipelines.
[xonsh](https://xon.sh)
[Oil/osh](https://www.oilshell.org)A very serious attempt by someone that understands UNIX shells well
[fish](https://fishshell.com)

## Rejected
I rejected these next two because they are hideously unpolished and missing many features...
### Python shell with object pipelines 
[Marcel](https://github.com/geophile/marcel)
### Ruby shell with object pipelines
[Rush](https://github.com/adamwiggins/rush)

This one used RPN for all arithmetic... was enough to make me not look further...
### Go shell with object pipelines
[Elvish](https://elv.sh)

## Most Humorous
There are many attempts to make Guile (Gnu's Scheme) into a shell... why?
[An Anatomy of Guile, The Interface to Tcl/Tk](http://www.usenix.org/publications/library/proceedings/tcl95/full_papers/lord.ps)
[gash](https://github.com/szos/gash
[scsh](https://cvs.savannah.gnu.org/viewvc/guile/guile/guile-scsh/
[I actually started working on a guile shell that parses a bash-like command line to a guile form.](https://news.ycombinator.com/item?id=18560115https://news.ycombinator.com/item?id=18560115)

But sadly, the winner of the top prize for making a functional programming language into a shell goes to:
[rash (based on Racket)[https://docs.racket-lang.org/rash/index.html]

And of course someone had to make a shell based on the brainfuck programming language...
[brainfuck-shell](https://snapcraft.io/brainfuck-shell)

Not a shell, but an important addition for any Linux shell, the "sl" command:
WARNING: under PowerShell there's a default alias "sl"... so either delete/override that, or say /usr/games/sl.
[sudo apt install sl](https://github.com/thekakester/sl)