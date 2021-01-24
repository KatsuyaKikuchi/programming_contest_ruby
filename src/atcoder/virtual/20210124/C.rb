a, b, c = gets.chomp.split(' ').map(&:to_i)

def solve(a, b, c)
  (1..b).each do |i|
    return true if i * a % b == c
  end
  false
end

ans = if solve(a, b, c)
        'YES'
      else
        'NO'
      end
puts ans
