x, y, a, b = gets.chomp.split(' ').map(&:to_i)
ans        = -1
while x < y
  ans  += 1
  nxt0 = x * a
  nxt1 = x + b
  if nxt0 <= nxt1
    x = nxt0
    next
  end
  ans += (y -1 - x) / b
  break
end
puts ans