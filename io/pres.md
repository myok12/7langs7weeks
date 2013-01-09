# IO

IO doesn't have any special powers other than it's extreme flexibility. The syntax of the language can be drastically modified in only a few lines. IO takes "Everything is an Object" to the extreme, from your typical `Object` to `operators` everything really is an object! 

## Great built in methods

```io
30 repeat("This will print 30 times" println)

laugh := "Ha" repeated(2)
laugh println # HaHa

# return new or use existing
myList := list(40, 23, 33)
newList := myList sort
myList sortInPlace
```

## Declarative

```io
# Declare a new var
foo = "foo" # Exception
foo := "foo"
foo = "bar" # Good to go!
```

## Adding operators
This is pretty awesome and I never considered doing it before. In `JavaScript` you can't  add precedence, but you can modify with the the `Boolean` prototype. Because an implementation of xor doesn't exist in JS, lets implement it!

```javascript
// JavaScript
Boolean.prototype.xor = function (bool) { 
   var val = this.valueOf();
   if (bool === true && val === true) { return false; } 
   else if (bool === true && val === false) { return true; } 
   else if ( bool === false && val === true) { return true; } 
   else { return false; }
};

true.xor(true); // false
true.xor(false); // true
false.xor(true); // true
false.xor(false); // false

var bool = "foo" === "foo";
if (bool.xor("bar" === "baz")) { // true
    // this will execute
}
```
Granted you can't give special precedence to the operator it's still a cool idea.

### Also quite frightening

Question 2 of self-study tells you to override the `/` method of `Number`. I don't really feel comfortable with that sort of power being available, but it is pretty cool to have the ability.

## Simple Singletons
```io
List clone := List # Can't clone List anymore >=]
```

## Go async!

`Futures` make it easy to execute some commands while a request runs on another thread

```io
writeln("Making a request to nyt")
result := URL with("http://www.nytimes.com") @fetch

writeln("This statement was not blocked by the future")
writeln("Request to ", result url, " is ", result size, " bytes")
writeln("This statement was blocked by the future")
```

## Not built for recursion

```io
fibRec := method(num,
    if(num <= 2,
        return 1,
        return fibRec(num - 1) + fibRec(num - 2)
    )
)
```

> Io doesn't have tail call elimination or many other facilities to help you out here. Io is inherently an imperative language, and not designed for efficient recursion. That said, Io takes the design decision that running out of stack space at a fixed low level, is not a good idea, and we'd prefer to be a little slower but allow you to recurse much longer. By this effect, what slows down recursion in Io is when we're about to run out of stack space, we create another object to act as part of the composite "call frame" and chain it together with the previous. Thus when you do exhaust stack space, we have another object of unlimited extent waiting there to catch your overflow. In this respect, it puts much more pressure on the allocator and the garbage collector, which is what makes recursion slower in Io. Fun fact, the more you recurse, the worse the effect is, as I'm sure is understandable based on my description above.

> While you can recurse into infinity*, that doesn't mean you should. As with in languages like C and otherwise, you should probably find an iterative algorithm if possible than a heavily recursive algorithm.

> * - Assuming you have an infinite amount of addressable RAM, and a backing store of infinite size
