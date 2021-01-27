s = gets.chomp.chars
(0...(2 ** 3)).each do |bit|
  sum = s[0].to_i
  3.times do |i|
    if ((bit >> i) & 1).zero?
      sum += s[i + 1].to_i
    else
      sum -= s[i + 1].to_i
    end
  end
  next if sum != 7

  ans = [s[0]]
  3.times do |i|
    ans.push(((bit >> i) & 1).zero? ? '+' : '-')
    ans.push(s[i + 1])
  end
  puts "#{ans.join()}=7"
  break
end
