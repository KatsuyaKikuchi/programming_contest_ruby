n, m = gets.chomp.split(' ').map(&:to_i)
x    = gets.chomp.split(' ').map(&:to_i)
x.sort!
d = Array.new(m, 0)
(m - 1).times do |i|
  d[i + 1] = x[i + 1] - x[i]
end
d.sort!
puts 0.upto(m - n).inject(0) { |s, v| s + d[v] }