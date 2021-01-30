n   = gets.to_i
arr = gets.chomp.split(' ').map(&:to_i)

ans  = 0
hash = { 0 => 1 }
sum  = 0
arr.each do |v|
  sum       += v
  val       = hash.key?(sum) ? hash[sum] : 0
  ans       += val
  hash[sum] = val + 1
end
puts ans