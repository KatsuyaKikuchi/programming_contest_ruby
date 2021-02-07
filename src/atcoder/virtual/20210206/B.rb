n   = gets.to_i
arr = []
n.times do
  arr << gets.to_i
end

arr.sort!
mn  = 0
ans = 0
arr.each do |v|
  if mn < v
    ans += 1
    mn  = v
  end
end
puts ans