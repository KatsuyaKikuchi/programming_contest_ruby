n = gets.to_i
s = gets.chomp.chars

one   = []
two   = []
three = []

s.each do |c|
  two.each do |x|
    three << x + c
  end
  one.each do |x|
    two << c + x
  end
  two.uniq!
  one << c
  one.uniq!
end

three.uniq!
puts three.length