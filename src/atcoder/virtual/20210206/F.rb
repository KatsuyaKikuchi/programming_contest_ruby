n        = gets.to_i
vertices = Array.new(n) { Array.new() }
(n - 1).times do
  a, b = gets.chomp.split(' ').map { |v| v.to_i - 1 }
  vertices[a] << b
  vertices[b] << a
end

ans = 0
num = 0
sum = 0
n.times do |i|
  num += 1
  vertices[i].each do |v|
    num -= 1 if v < i
  end
  sum += num
end
ans = 0
n.times do |i|
  ans += sum
  sum -= n - i
  vertices[i].each do |v|
    sum += n - v if v > i
  end
end
puts ans