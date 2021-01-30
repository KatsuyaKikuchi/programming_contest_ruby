n, d = gets.chomp.split(' ').map(&:to_i)
ans  = 0
n.times do
  x, y = gets.chomp.split(' ').map(&:to_i)
  ans  += 1 if x ** 2 + y ** 2 <= d ** 2
end
puts ans