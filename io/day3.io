###
# @1
###

Builder := Object clone
Builder indent := 0
Builder incIndent := method(self indent = self indent + 1)
Builder decIndent := method(self indent = self indent - 1)
Builder forward := method(
    msgName := call message name
    indentHelper := "    " repeated(self indent)

    writeln(indentHelper, "<", msgName, ">")

    self incIndent

    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content type == "Sequence", 
            writeln(indentHelper, content)
        )
    )

    self decIndent
    writeln(indentHelper, "</", msgName, ">")
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
) println

###
# @2
###

curlyBrackets := method(
    call message arguments map(arg,
        self doMessage(arg)
    )
)

writeln
{ 1, 2, 3 ,4 } println

###
# @3
###


######## Extra
viz := Object clone
viz talk := method(
    "talk 1" println
    yield
    "talk 2" println
    yield
)

fiz := Object clone
fiz talk := method(
    yield
    "rhyme 1" println
    yield
    "rhyme 2" println
)

viz @@talk
fiz @@talk

Coroutine currentCoroutine pause
