Object ancestors := method(
   prototype := self proto
   if(prototype != Object,
       writeln("Slots of ", prototype type, "\n---------")
       prototype slotNames foreach(slotName, writeln(slotName))
       writeln
       prototype ancestors # Recursion to parent
    )
)

Animal := Object clone
Animal speak := method("Ambiguous animal noise" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors

/*
→ io animals.io
Slots of Duck
---------
type
speak
walk

Slots of Animal
---------
type
speak
*/
