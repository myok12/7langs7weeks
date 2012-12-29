#1
puts "each"
arr = [ (1..4).to_a, (5..8).to_a, (9..12).to_a, (13..16) ]
arr.each { |_arr| _arr.each { |i| puts i } }
puts "each_slice"
#(1..4).each_slice(4) { |i| (i..i+3).each_slice(4) { |i| puts i } }
