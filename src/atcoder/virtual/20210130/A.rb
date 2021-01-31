g = gets.chomp.chars.group_by { |v| v }
puts g.length == 2 ? 'Yes' : 'No'
