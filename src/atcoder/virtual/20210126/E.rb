class UnionFind
  def initialize(size)
    # if @parent_or_size[i] < 0 -> i is root node and group size is -@parent_or_size[i]
    # otherwise, @paretnt_or_size[i] is i's parent index
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

n, m = gets.chomp.split(' ').map(&:to_i)
uf   = UnionFind.new(n)
m.times do
  a, b = gets.chomp.split(' ').map { |x| x.to_i - 1 }
  uf.unit(a, b)
end

ans = n
uf.group.each do |v|
  ans -= v.length - 1
end
puts ans
