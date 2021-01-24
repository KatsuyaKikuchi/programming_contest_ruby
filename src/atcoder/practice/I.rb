n, v = gets.chomp.split(' ').map(&:to_i)
ans  = [-1, -1, -1]
(0..n).each do |x|
  (0..n - x).each do |y|
    z   = n - (x + y)
    ans = [x, y, z] if x * 10_000 + y * 5000 + z * 1000 == v
  end
end
puts "#{ans[0]} #{ans[1]} #{ans[2]}"