n   = gets.to_i
arr = gets.chomp.split(' ').map(&:to_i)
d   = arr.inject(0) { |ret, v| v - ret }

ans = [d]
(1...n).each do |i|
  ans << (arr[i - 1] - ans[i - 1] / 2) * 2
end
puts ans.join(' ')