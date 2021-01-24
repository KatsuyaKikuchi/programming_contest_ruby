n = gets.to_i
a = gets.chomp.split(' ').map(&:to_i)

ans = 0
while a.all?(&:even?) do
  ans += 1
  a   = a.map { |v| v / 2 }
end
puts ans
