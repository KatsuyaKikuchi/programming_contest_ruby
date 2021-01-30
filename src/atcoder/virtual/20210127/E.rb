h, w, k = gets.chomp.split(' ').map(&:to_i)
mod     = 998_244_353
board   = Array.new(h) { Array.new(w, 0) }
k.times do
  a, b, c     = gets.chomp.split(' ')
  a           = a.to_i - 1
  b           = b.to_i - 1
  board[a][b] = c.ord
end

dp0    = Array.new(w + 1, 0)
dp1    = Array.new(w + 1, 0)
dp0[0] = 3.pow(h * w - k, mod)
i      = 0
mul    = (2 * 3.pow(mod - 2, mod)) % mod
while i < h
  line = board[i]
  j    = 0
  while j < w
    case line[j]
    when 0
      val        = dp0[j] * mul % mod
      dp0[j + 1] += val
      dp1[j]     = val
    when 88
      dp1[j]     = dp0[j]
      dp0[j + 1] += dp0[j]
    when 82
      dp0[j + 1] += dp0[j]
      dp1[j]     = 0
    when 68
      dp1[j] = dp0[j]
    end
    j += 1
  end
  dp0, dp1 = dp1, dp0
  i        += 1
end

puts dp1[w - 1] % mod
