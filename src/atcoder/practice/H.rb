n = gets.to_i
a = []
n.times do
  a << gets.to_i
end
a.sort!
ans = a.inject([0, 0]) { |arg, v|
  if arg[1] < v
    arg[0] = arg[0] + 1
    arg[1] = v
  end
  arg
}
puts ans[0]