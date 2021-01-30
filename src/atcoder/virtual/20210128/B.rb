s, p = gets.chomp.split(' ').map(&:to_i)

n    = 1
find = false
while n ** 2 <= p
  break if n > s
  m    = s - n
  find = n * m == p
  n    += 1
  break if find
end

puts find ? 'Yes' : 'No'