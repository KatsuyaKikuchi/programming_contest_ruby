n = gets.to_i

sum  = 0
nums = []
(1..n).each do |i|
  sum += i
  nums << i
  next if sum < n

  nums = nums.filter { |x| x != sum - n }
  puts nums
  break
end