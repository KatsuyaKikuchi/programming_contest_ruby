n, m, r = gets.chomp.split(' ').map(&:to_i)
town    = gets.chomp.split(' ').map { |v| v.to_i - 1 }

dist = Array.new(n) { Array.new(n, 10 ** 15) }
m.times do
  a, b, c            = gets.chomp.split(' ').map(&:to_i)
  dist[a - 1][b - 1] = c
  dist[b - 1][a - 1] = c
end
n.times do |i|
  dist[i][i] = 0
end

n.times do |k|
  n.times do |i|
    n.times do |j|
      dist[i][j] = [dist[i][j], dist[i][k] + dist[k][j]].min
    end
  end
end

ans = 10 ** 18
town.sort!
towns = town.permutation.to_a
towns.each do |twn|
  cost = 0
  (0...(r - 1)).each do |i|
    idx0 = twn[i]
    idx1 = twn[i + 1]
    cost += dist[idx0][idx1]
  end
  ans = [ans, cost].min
end
puts ans