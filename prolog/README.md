# [Prolog](http://www.gprolog.org/)

## Download and install

[Download](http://www.gprolog.org/#download) or run `brew install gnu-prolog` on a Mac (failed on mine).

## Useful links

* [Source](http://sourceforge.net/projects/gprolog/)

* [Reference](http://www.gprolog.org/manual/gprolog.html)


## Gotchas

In order to be able to run examples from the book, you have to either:

1. put them in a separate file and link it -- by running `gprolog --consult-file <FILE>` 
1. run the command `[user].` in the interactive shell, then type all your facts and rules, followed by
Ctrl+D (=EOF). 

Then you can query you KB as much as you like in either case.


## Review

* [Basic Usage](usage.md)

* [Advanced Usage](advanced.md)
