n, k, c = gets.chomp.split(' ').map(&:to_i)
s       = gets.chomp.chars

dp = Array.new(n + 1, 0)
(n - 1).downto(0) do |i|
  dp[i] = dp[i + c + 1].nil? ? 1 : dp[i + c + 1] + 1 if s[i] == 'o'
  dp[i] = [dp[i], dp[i + 1]].max
end

left  = -c - 1
count = 0
ans   = []
s.each_with_index do |t, i|
  idx   = [left + c + 1, i + 1].max
  right = dp[idx].nil? ? 0 : dp[idx]
  ans << i + 1 if count + right < k

  if left + c < i && t == 'o'
    left  = i
    count += 1
  end
end

puts ans
