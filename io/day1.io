### 
# @1
###

1 + 1
# ==> 2

1 + "one"
#  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#  ---------
#  message '+' in 'Command Line' on line 1
# 
# IO is strongly typed because the statement was not automatically converted to a string
#

### 
# @2
###
#
0 and true
# ==> true

"" and true
# ==> true

nil and false
# ==> false

nil and true
# ==> false

### 
# @3
###

Foo := Object clone
Foo bar := method("foobar" print)
Foo slotNames
# ==> list(bar, type)

### 
# @4
###
# = Assigns a value to a slot if the value exists, otherwise raises exception
# := Creates a slot and assigns the value
# ::= Creats a slot, creates a setter, and assigns value

### 
# @5
# @desc Run day1demo.io
###
