str  = gets.chomp
strs = ['dream', 'dreamer', 'erase', 'eraser']
idx  = str.length.to_i
while idx > 0
  fnd = false
  strs.each do |s|
    len = s.length.to_i
    next if (idx - len).negative?

    sub = str[idx - len, len]
    next unless sub == s
    idx  -= len
    fnd = true
    break
  end
  if !fnd
    puts 'NO'
    return
  end
end
puts 'YES'
