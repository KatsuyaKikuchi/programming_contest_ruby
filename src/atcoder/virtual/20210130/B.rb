n = gets.chomp.chars.map(&:to_i)

sum = n.inject(0) { |s, v| s + v }
g   = n.group_by { |v| v % 3 }
one = g[1].nil? ? 0 : g[1].length
two = g[2].nil? ? 0 : g[2].length

ans = case sum % 3
      when 0
        0
      when 1
        if one.positive?
          1
        elsif two >= 2
          2
        else
          -1
        end
      when 2
        if two.positive?
          1
        elsif one >= 2
          2
        else
          -1
        end
      end
ans = -1 if ans == n.length
puts ans