Foo := Object clone
Foo bar := method("foobar" print)
foo := Foo clone
foo bar
# foobar==> foobar 

"\n" print

# Add more inheritance
Bar := Foo clone
Bar bar := method(
    Foo bar # Parent clone
    " from Bar" print
)
Bar bar
