n    = gets.to_i
nums = []
while n.positive?
  nums << (n - 1) % 26
  n = (n - 1) / 26
end

ans = nums.reverse.map { |v| ('a'.ord + v).chr }
puts ans.join