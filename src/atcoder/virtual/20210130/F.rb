n, m   = gets.chomp.split(' ').map(&:to_i)
edge   = []
vertex = Array.new(n) { [] }
m.times do
  a, b = gets.chomp.split(' ').map { |v| v.to_i - 1 }
  edge << [a, b]
  vertex[a] << b
  vertex[b] << a
end

dist = Array.new(n, -1)
q    = [[0, 0]]
until q.empty?
  val       = q.shift
  idx, dst  = val
  dist[idx] = dst
  vertex[idx].each do |nxt|
    next if dist[nxt] >= 0

    q.push([nxt, (dst + 1) % 2])
  end
end

group = dist.group_by { |v| v }

ans  = n * (n - 1) / 2 - m
same = [false, false]
edge.each do |a, b|
  same[dist[a]] = true if dist[a] == dist[b]
end

unless same[0] || same[1]
  ans -= group[0].length * (group[0].length - 1) / 2 + group[1].length * (group[1].length - 1) / 2
end

puts ans
