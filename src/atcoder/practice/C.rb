s = gets.chomp
ans = s.each_char.inject(0) { |sum, value|
  sum += 1 if value == '1'
  sum
}
puts ans
