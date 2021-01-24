n, m = gets.chomp.split(' ').map(&:to_i)

ans = []
(0...m).each do |i|
  len = m - i
  s   = if i.even?
          i / 2
        else
          n - 1 - (i / 2)
        end
  t   = if i.even?
          s + len
        else
          s - len
        end
  ans << [s + 1, t + 1]
end
ans.each { |sub| puts sub.join(' ') }
