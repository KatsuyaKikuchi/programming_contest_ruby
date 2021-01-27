n, q  = gets.chomp.split(' ').map(&:to_i)
s     = gets.chomp.chars
count = [0]

s.each_with_index do |c, i|
  count[i + 1] = count[i]
  count[i + 1] += 1 if i.positive? && s[i - 1] + s[i] == 'AC'
end

q.times do
  l, r = gets.chomp.split(' ').map(&:to_i)
  puts count[r] - count[l]
end