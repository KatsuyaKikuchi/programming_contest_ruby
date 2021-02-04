n, m = gets.chomp.split(' ').map(&:to_i)
sums = Array.new(n + 1, 0)
m.times do
  x, y        = gets.chomp.split(' ').map(&:to_i)
  sums[x - 1] += 1
  sums[y]     -= 1
end
n.times do |i|
  sums[i + 1] += sums[i]
end
puts sums.inject(0) { |sum, v| v == m ? sum + 1 : sum }