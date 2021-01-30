s = gets.chomp
d = 15 - s.length

count = s.chars.inject(0) { |sum, c| c == 'o' ? sum + 1 : sum }

puts count + d >= 8 ? 'YES' : 'NO'