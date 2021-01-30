n = gets.to_i

ok, ng = 0, 10 ** 18
while (ng - ok).abs > 1
  mid = (ok + ng) / 2
  s   = (mid + 1) * mid / 2
  if s <= n + 1
    ok = mid
  else
    ng = mid
  end
end

puts n - ok + 1