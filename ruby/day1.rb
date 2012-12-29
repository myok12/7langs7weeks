# 1
puts "Hello, World"

#2
puts "Hello, Ruby".index("Ruby")

#3
puts "This is sentence number 1".gsub("1", "10")

#4
def runGuessProgram(num)
    ans = nil
    while ans != num
        puts "Guess the number (#{num}):"
        ans = gets.to_i
        puts "Too high" if ans > num 
        puts "Too low" if ans < num 
    end

    puts "Grats, you are super hardcore.\nThe number was: #{num}"
end
num = rand(10)
runGuessProgram(num)
