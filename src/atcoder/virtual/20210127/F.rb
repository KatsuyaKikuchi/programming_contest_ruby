def inc?(arr)
  val = -1
  arr.each do |v|
    return false if v < val
    val = v
  end
  true
end

n = gets.to_i
a = gets.chomp.split(' ').map(&:to_i)
b = gets.chomp.split(' ').map(&:to_i)

ans = 10 ** 18
(0...2 ** n).each do |bit|
  odd  = []
  even = []
  n.times do |i|
    if ((bit >> i) & 1).positive?
      if (i % 2).positive?
        odd << [b[i], i]
      else
        even << [b[i], i]
      end
    else
      if (i % 2).positive?
        even << [a[i], i]
      else
        odd << [a[i], i]
      end
    end
  end
  next if odd.length - even.length > 1 || (odd.length - even.length).negative?

  even.sort_by! { |v| v[0] * n + v[1] }
  odd.sort_by! { |v| v[0] * n + v[1] }
  arr, arr1 = Array.new(n), Array.new(n)
  even.each_with_index do |v, i|
    arr[2 * i + 1]  = v[1]
    arr1[2 * i + 1] = v[0]
  end
  odd.each_with_index do |v, i|
    arr[2 * i]  = v[1]
    arr1[2 * i] = v[0]
  end

  next unless inc?(arr1)

  idx = []
  (0...n).each { |i| idx << i }
  sum = 0
  arr.each_with_index do |v, i|
    sum += idx[v] - i
    (0...v).each { |vv| idx[vv] += 1 }
  end
  ans = [sum, ans].min
end

ans = -1 if ans == 10 ** 18
puts ans