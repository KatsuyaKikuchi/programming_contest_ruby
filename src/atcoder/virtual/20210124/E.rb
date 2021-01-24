n = gets.to_i

(1..n).each do |x|
  next if x * (x + 1) / 2 != n

  idx = 1
  ans = []
  (0...x + 1).each do |i|
    sub = []
    (0...i).each do |j|
      sub << ans[j][i - 1]
    end
    while sub.length < x
      sub << idx
      idx += 1
    end
    ans << sub
  end

  puts 'Yes'
  puts ans.length
  ans.each do |sub|
    puts "#{sub.length} #{sub.join(' ')}"
  end
  return
end
puts 'No'

