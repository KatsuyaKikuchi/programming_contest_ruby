k = gets.to_i
s = 0
k.times do |i|
  s = (s * 10 + 7) % k
  if s.zero?
    puts i + 1
    return
  end
end
puts -1