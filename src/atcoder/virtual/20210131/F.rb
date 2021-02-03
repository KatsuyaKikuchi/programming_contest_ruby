n, k = gets.chomp.split(' ').map(&:to_i)
p    = gets.chomp.split(' ').map(&:to_i)

max = []
min = []
k.times do |i|
  until max.empty?
    break if max.last[0] > p[i]

    max.pop
  end
  until min.empty?
    break if min.last[0] < p[i]

    min.pop
  end
  max << [p[i], i]
  min << [p[i], i]
end

ans = 1
cnt = min.size == k ? 1 : 0
k.upto(n - 1) do |i|
  mi = [10 ** 18, 10 ** 18]
  max.shift if i - max.first[1] >= k
  mi = min.shift if i - min.first[1] >= k
  until max.empty?
    break if max.last[0] > p[i]

    max.pop
  end
  until min.empty?
    break if min.last[0] < p[i]

    min.pop
  end
  max << [p[i], i]
  min << [p[i], i]
  cnt += 1 if min.size == k
  unless mi[1] != 10 ** 18 && max.first[1] == i
    ans += 1 if min.size != k || cnt <= 1
  end
end

puts ans