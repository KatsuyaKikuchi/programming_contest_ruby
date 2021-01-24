s   = gets.chomp
ans = if s[0] == s[1] && s[1] == s[2]
        'Won'
      else
        'Lost'
      end
puts ans