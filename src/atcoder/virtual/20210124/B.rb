def check(s)
  return false if s[0] != 'A'
  return false if s[2, s.length - 3].chars.each.count('C') != 1

  count = s.chars.filter { |value| value == value.upcase }.length
  count == 2
end

s   = gets.chomp
ans = if check(s)
        'AC'
      else
        'WA'
      end
puts ans
