###
# @1
###

fib := method(num,
    numbers := list(0,1)
    i := 2 
    for(i, 2, num, 
        val := numbers at(i - 1) + numbers at(i - 2)
        numbers append(val)
    )
    numbers at(numbers size - 1)
)

"Fib with a loop\n---------" println
fib(1) println
fib(4) println
fib(17) println # fib of how much would a woodchuck would chuck
fib(42) println # fib of meaning of life
writeln

fibRec := method(num,
    if(num <= 2,
        return 1,
        return fibRec(num - 1) + fibRec(num - 2)
    )
)
    
"Fib with recurssion\nMuch slower\n---------" println
fibRec(1) println
fibRec(4) println
fibRec(17) println # fib of how much would a woodchuck would chuck
#fibRec(42) println # fib of meaning of life
writeln

###
# @2
###

# Store reference to original division operator
Number divide := Number getSlot("/")

# Overwrite it!
Number / = method(num, if(num == 0, return 0, return self divide(num)))

# Use it!
4 / 2 println # 2
4 / 0 println # 0
writeln

###
# @3
###
List deepAdd := method(
    flat := self flatten()
    sum := nil

    flat foreach(i, val,
        if(val type == "Number", sum = val + if (sum, sum, 0))
    )
    return sum
)

numbers := list(1,list(2,3,4,5),3,4)
numbers deepAdd println
numbers := list(1,list(2,3,4,5),3,4, "a", "b") # Ignores non Number
numbers deepAdd println
writeln

###
# @4
###
List myAverage := method(
    if (self size < 1, return nil)
    sum := 0
    self foreach(i, val,
        if (val type != "Number", Exception raise("The non-numeric value `" .. val .. "` cannot be averaged"))
        sum = sum + val
    )
    return sum / self size
)

numbers := list(1,3,4,10)
numbers myAverage println
#mixed := list(1,2,"a",true) # Exception will be raised
#mixed myAverage println
writeln

###
# @5
###

DimList := List clone
DimList dim := method(x, y,
    # Make this method easier to work with by creating a proper cloned object
    # upon usage otherwise size could be changed at any point
    if(self proto type == List,
        return DimList clone dim(x, y)
    )
    
    # Set the size of our list
    self setSize(x)

    for(i, 0, x - 1,
        self atPut( i, list() setSize(y))
    )
    # ULTRA COMBO!!!!
    return self
)

DimList set := method(x, y, val,
    self at(x) atPut(y, val)
    return self
)
DimList get := method(x, y, 
    return self at(x) at(y)
)

# @6 implement transpose

###
# @7
###
matrix := DimList dim(3, 3) 
matrix set(0, 0, "foo") set(0, 1, "foo2") set(0, 2, "foo3")
matrix set(1, 0, "bar") set(1, 1, "bar2") set(1, 2, "bar3")
matrix set(2, 0, "baz") set(2, 1, "baz2") set(2, 2, "baz3") 

matrix println
"1st set:" .. matrix get(0, 0) println
"2nd set:" .. matrix get(1, 1) println
"3rd set:" .. matrix get(2, 2) println
writeln

path := "./day2q7.txt"

# Create / write file
file := File open(path)
file write(matrix serialized)
file close

# Read and print file
# Open file
fileMatrix := File with(path) openForReading contents
fileMatrix println
writeln

###
# @8
###

# Guess between 1 and 10
randNum := (Random value(9) + 1) floor

input := File clone standardInput
guess := nil
prevGuess := nil

# Awesome method on Number
10 repeat(
    "Guess a number from 1-10: " println
    guess = input readLine("Enter an integer: ") asNumber
    if (guess == randNum,
        break,

        if(prevGuess,
            hint := if((randNum - guess) abs >= (randNum - prevGuess) abs, "colder...", "warmer!")
            hint println,
            "Guess again: " print
        )
        prevGuess = guess
    )
)   

if (guess == randNum,
    "You win" println,
    "You lose" print
)

writeln
