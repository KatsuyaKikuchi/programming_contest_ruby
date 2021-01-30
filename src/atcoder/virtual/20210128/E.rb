n    = gets.to_i
red  = []
blue = []
n.times do
  red << gets.chomp.split(' ').map(&:to_i)
end
n.times do
  blue << gets.chomp.split(' ').map(&:to_i)
end

blue.sort_by! { |v| v[0] }
ans = 0
blue.each do |b|
  idx = -1
  red.each_with_index do |r, i|
    next if r[0] >= b[0] || r[1] >= b[1]

    idx = i if idx == -1 || red[idx][1] < r[1]
  end

  if idx >= 0
    ans += 1
    red.delete_at(idx)
  end
end

puts ans