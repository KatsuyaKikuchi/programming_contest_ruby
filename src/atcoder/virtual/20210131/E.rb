nums = gets.chomp.chars.map(&:to_i).reverse
nums << 0

ans = 0
up  = false
nums.each_with_index do |v, i|
  is_up = v > 5
  is_up = true if v >= 5 && nums[i + 1] >= 5
  is_up = true if v >= 5 && up
  is_up = true if v >= 4 && up && nums[i + 1] >= 5
  if !is_up
    ans += v
    ans += 1 if up
    up  = false
  else
    ans += 10 - v
    ans -= 1 if up
    up  = true
  end
end
puts ans


