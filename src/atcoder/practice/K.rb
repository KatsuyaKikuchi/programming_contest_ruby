n = gets.to_i
a = []
n.times do
  a << gets.chomp.split(' ').map(&:to_i)
end

time = 0
grid = [0, 0]
a.each do |v|
  dist = v[0] - time - ((v[1] - grid[0]).abs + (v[2] - grid[1]).abs)

  if dist.negative? || dist.odd?
    puts 'No'
    return
  end
  time = v[0]
  grid = [v[1], v[2]]
end

puts 'Yes'
