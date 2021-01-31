n, m     = gets.chomp.split(' ').map(&:to_i)
a        = gets.chomp.split(' ').map(&:to_i)
b        = gets.chomp.split(' ').map(&:to_i)
INF      = 10 ** 18
dp       = Array.new(m + 1) { Array.new(n + 1, INF) }
dp[0][0] = 0
(n + 1).times { |i| dp[0][i] = i }
(m + 1).times { |i| dp[i][0] = i }
m.times do |i|
  n.times do |j|
    dp[i + 1][j + 1] = [dp[i][j + 1], dp[i + 1][j], dp[i][j]].min + 1
    dp[i + 1][j + 1] = [dp[i + 1][j + 1], dp[i][j]].min if a[j] == b[i]
  end
end

puts dp[m][n]