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

    # Indent for textNode
    oldIndentHelper := indentHelper
    indentHelper = "    " repeated(self indent)

    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content type == "Sequence", 
            writeln(indentHelper, content)
        )
    )

    self decIndent
    indentHelper = oldIndentHelper
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
    call message arguments map(arg, return self doMessage(arg))
)

writeln
{ 1, 2, 3 , list(1,2,3) } println

###
# @3
###


######## Extra
# Futurez, yo
#

writeln("Making a request to nyt")
result := URL with("http://www.nytimes.com") @fetch

writeln("This statement was not blocked by the future")
writeln("Request to ", result url, " is ", result size, " bytes")
writeln("This statement was blocked by the future")
