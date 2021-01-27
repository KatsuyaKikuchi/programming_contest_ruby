n     = gets.to_i
names = []
n.times do
  names << gets.chomp
end

chars = %w[M A R C H]
count = [0, 0, 0, 0, 0]
names.each do |name|
  idx = chars.index(name[0])
  next if idx.nil?

  count[idx] += 1
end

ans = 0
(0..4).each do |i|
  (i + 1..4).each do |j|
    (j + 1..4).each do |k|
      ans += count[i] * count[j] * count[k]
    end
  end
end
puts ans