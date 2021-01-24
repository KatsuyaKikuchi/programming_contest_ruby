a, b = gets.chomp.split(' ').map(&:to_i)
c    = a * b

puts c.even? ? 'Even' : 'Odd'
