a = gets.to_i
b = gets.to_i
c = gets.to_i
x = gets.to_i

ans = 0
(0..a).each do |na|
  (0..b).each do |nb|
    (0..c).each do |nc|
      ans += 1 if x == na * 500 + nb * 100 + nc * 50
    end
  end
end
puts ans
