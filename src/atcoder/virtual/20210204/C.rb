class UnionFind
  def initialize(size)
    # if @parent_or_size[i] < 0 -> i is root node and group size is -@parent_or_size[i]
    # otherwise, @parent_or_size[i] is i's parent index
    @parent_or_size = Array.new(size, -1)
  end

  # find n's parent node
  def find(x)
    return x if (@parent_or_size[x]).negative?

    @parent_or_size[x] = find(@parent_or_size[x])
  end

  # check x's parent node equal y's parent node
  def same(x, y)
    find(x) == find(y)
  end

  alias same? same

  # get x's group size
  def size(x)
    -@parent_or_size[find(x)]
  end

  # merge x's group and y's group
  def unit(x, y)
    x = find(x)
    y = find(y)
    return x if x == y

    if @parent_or_size[x] < @parent_or_size[y]
      @parent_or_size[x] += @parent_or_size[y]
      @parent_or_size[y] = x
    else
      @parent_or_size[y] += @parent_or_size[x]
      @parent_or_size[x] = y
    end
  end

  def group
    (0...@parent_or_size.size).group_by { |i| find(i) }.values
  end

  def debug_draw
    puts @parent_or_size.join(' ')
  end
end

n   = gets.to_i
arr = gets.chomp.split(' ').map(&:to_i)
ans = 0
uf  = UnionFind.new(n)
v   = []
arr.each_with_index do |t, i|
  v << [t, i]
end
v.sort_by! { |v| -v[0] }
seen = Array.new(n + 1, false)
v.each do |val, idx|
  seen[idx] = true
  uf.unit(idx, idx - 1) if seen[idx - 1]
  uf.unit(idx, idx + 1) if seen[idx + 1]
  ans = [ans, val * uf.size(idx)].max
end

puts ans