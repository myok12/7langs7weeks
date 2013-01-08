# [IO](http://iolanguage.org/)

## Download and install

[Github](https://github.com/stevedekorte/io)

or 

`brew install io`

Useful links
* [Reference](http://iolanguage.org/scm/io/docs/reference/index.html)

## Day 1

* Example Code

```io
Number factorial := method(n := 1; for(i, 1, self, n = n * i); n)
```

* [IO Community](http://tech.groups.yahoo.com/group/iolanguage/)
* [Style Guide](http://iolanguage.org/scm/io/docs/IoGuide.html)


## Day 2

### Thoughts

#### Adding operators
This is pretty awesome and I never considered doing it before. In `JavaScript` you can't actually create operators, but you can play with the the `Boolean` type. Because the implementation of xor doesn't exist in JS, lets implement it!

> Implementation of `xor` on `Boolean`

```javascript
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
```

This is pretty cool because now we can compare values and ensure only one is true.

```javascript
var bool = "foo" === "foo"; // true
if (bool.xor("bar" === "baz")) {
    // this will execute
}
```
Granted you can't give special precedence to the operator it's still a cool idea.

#### Overiding Operators

Question 2 of self-study tells you to override the `/` method of `Number`. This is quite frightening! `Javascript` has a lot of freedom, but at least you can't override operators! Don't get me wrong, it's awesome that you can do something like that, but that kind of power is scary!
