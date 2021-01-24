n, k  = gets.chomp.split(' ').map(&:to_i)
s     = gets.chomp
ans   = 0
count = 0
(1...n).each do |i|
  if s[i] != s[i - 1]
    count += 1
  else
    ans += 1
  end
end

ans += [2 * k, count].min
puts ans
