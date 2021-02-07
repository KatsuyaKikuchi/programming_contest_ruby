n = gets.to_i

def check(val)
  hash = {}
  while val.positive?
    hash[val % 10] = true
    val            /= 10
  end
  hash.keys.size == 3
end

def dfs(val, n)
  return 0 if val > n

  ret = check(val) ? 1 : 0
  [3, 5, 7].each do |v|
    tmp = val * 10 + v
    ret += dfs(tmp, n)
  end
  ret
end

puts dfs(0, n)