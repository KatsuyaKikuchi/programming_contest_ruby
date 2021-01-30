n, k = gets.chomp.split(' ').map(&:to_i)
hp   = gets.chomp.split(' ').map(&:to_i)
hp.sort_by!(&:-@)

ans = 0
k.upto(n - 1) do |i|
  ans += hp[i]
end
puts ans