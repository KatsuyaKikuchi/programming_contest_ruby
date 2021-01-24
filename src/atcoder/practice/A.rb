a    = gets.to_i
b, c = gets.chomp.split(' ').map { |value| value.to_i }
s    = gets.chomp

puts "#{a + b + c} #{s}"
