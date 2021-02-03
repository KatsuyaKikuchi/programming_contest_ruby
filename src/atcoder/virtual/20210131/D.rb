def gcd(a, b)
  a, b = b, a if a < b
  c    = a % b
  return b if c.zero?

  gcd(b, c)
end

n   = gets.to_i
arr = gets.chomp.split(' ').map(&:to_i)

right        = Array.new(n + 1, 1)
right[n - 1] = arr[n - 1]
(n - 2).downto(0) do |i|
  right[i] = gcd(right[i + 1], arr[i])
end

ans  = right[1]
left = arr[0]
(1...n - 1).each do |i|
  ans  = [ans, gcd(left, right[i + 1])].max
  left = gcd(left, arr[i])
end
ans = [left, ans].max
puts ans
