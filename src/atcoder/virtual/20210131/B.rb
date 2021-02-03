n, k   = gets.chomp.split(' ').map(&:to_i)
height = []
n.times do
  height << gets.to_i
end
height.sort!
ans = 10 ** 18
n.times do |i|
  break if i + k - 1 >= n

  ans = [height[i + k - 1] - height[i], ans].min
end
puts ans