n   = gets.to_i
arr = gets.chomp.split(' ').map(&:to_i)
ans = 0
mp  = {}
arr.each_with_index do |val, idx|
  ans           += mp.key?(idx - val) ? mp[idx - val] : 0
  mp[val + idx] = 0 unless mp.key?(val + idx)
  mp[val + idx] += 1
end
puts ans