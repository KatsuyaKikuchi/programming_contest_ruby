n         = gets.to_i
$arr      = gets.chomp.split(' ').map(&:to_i)
$vertices = Array.new(n) { [] }
(n - 1).times do
  a, b = gets.chomp.split(' ').map { |v| v.to_i - 1 }
  $vertices[a] << b
  $vertices[b] << a
end

$ans = Array.new(n, 0)

def lower_bound(nums, num)
  ok = -1
  ng = nums.length
  while (ng - ok).abs > 1
    mid = (ok + ng) / 2
    if nums[mid] < num
      ok = mid
    else
      ng = mid
    end
  end
  ok
end

$seen = Array.new(n) { false }

def dfs(idx, nums)
  $seen[idx]   = true
  id           = lower_bound(nums, $arr[idx])
  num          = nums[id + 1]
  nums[id + 1] = $arr[idx]
  $ans[idx] = lower_bound(nums, 10 ** 18) + 1
  $vertices[idx].each do |i|
    next if $seen[i]

    dfs(i, nums)
  end
  nums[id + 1] = num
end

dp = Array.new(n + 1, 10 ** 18)
dfs(0, dp)

puts $ans