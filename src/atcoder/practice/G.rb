n = gets.to_i
a = gets.chomp.split(' ').map(&:to_i)
a.sort_by!(&:-@)

s  = a.inject(0) { |sum, v| sum += v }
s0 = a.each_with_index.filter_map { |v, i| v if i.even? }.inject(0) { |sum, v| sum += v }
puts 2 * s0 - s