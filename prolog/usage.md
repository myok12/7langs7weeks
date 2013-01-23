# Prolog Usage

### Atoms
start with lower case, e.g. `cheese`.

### Variables
start with upper case or underscore, e.g. `FOOD`.

### Facts
Facts are observations of our world, e.g. `likes(wallace, cheese)`.

### Unification
you can have Prolog try different atoms to satisfy an unbound variable, e.g. `| ?- likes(CHARACTER, cheese)`.

### Rules
Allows prolog to match complex facts by binding variables, e.g. `friend (CHARACTER1, CHARACTER2) :- \+(X=Y), likes (CHARACTER1, FOOD), likes (CHARACTER2, FOOD)`.

All terms within a rule **must** (logical and) be satisfied.
Multiple rule [or fact] definitions can exists; any one definition needs (logical or) be satisfied for it to match.

### Lists
Lists are the only real data structure available in Prolog. Prolog's
lists can be destructured into multiple atoms directly, e.g. `[A, B, C, D] = [a, b, c, d]`. 
They can also be destructured into preceding atoms and a sublist, using `|` e.g. `[A, B | REST] = [a, b, c, d, e]` succeeds while `[A, B, REST] = [a, b, c, d, e]` fails.
The idea is not to 

### Tuples
Tuples are similar to lists, except they only allow for exact parameter matching.

### Built-ins
helpers, stdin and stdout, files, sockets; see [reference](http://www.gprolog.org/manual/gprolog.html#htoc69).

## Links

[Introduction to Prolog](http://www.cse.unsw.edu.au/~billw/cs9414/notes/prolog/intro.html)
