n, a, b = gets.chomp.split(' ').map(&:to_i)
ans     = 0
(1..n).each do |value|
  s   = value.to_s.chars.inject(0) { |sum, v| sum += v.to_i }
  ans += value if (a..b).include?(s)
end
puts ans