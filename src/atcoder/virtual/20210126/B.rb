a, b, x, y = gets.chomp.split(' ').map(&:to_i)

ans = if a == b
        x
      elsif a < b
        if 2 * x < y
          (2 * (b - a) + 1) * x
        else
          (b - a) * y + x
        end
      else
        if 2 * x < y
          (2 * (a - b - 1) + 1) * x
        else
          (a - b - 1) * y + x
        end
      end

puts ans