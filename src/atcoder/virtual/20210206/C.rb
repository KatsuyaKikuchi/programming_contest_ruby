x    = gets.to_i
a    = 1
hash = { 0 => 0 }
loop do
  p = a ** 5
  if hash.key?((x - p).abs)
    b = hash[(x - p).abs]
    b = if p - b ** 5 == x
          b
        else
          -b
        end
    puts "#{a} #{b}"
    break
  end
  hash[p] = a
  a       += 1
end