require 'minitest/autorun'
require '../lib/union_find'

class UnionFindTest < Minitest::Test
  def test_find
    size = 10
    uf   = UnionFind.new(size)
    (0...size).each do |i|
      assert_equal i, uf.find(i)
    end
  end

  def test_unit
    size = 10
    uf   = UnionFind.new(size)
    1.step(size - 2, 2) do |i|
      uf.unit(i, i + 2)
    end
    1.step(size, 2) do |i|
      1.step(size, 2) do |j|
        assert_equal uf.find(i), uf.find(j)
      end
      0.step(size - 1, 2) do |j|
        assert uf.find(i) != uf.find(j)
      end
    end
    0.step(size - 1, 2) do |i|
      (i + 2).step(size - 1, 2) do |j|
        assert uf.find(i) != uf.find(j)
      end
    end
  end

  def test_size
    size = 10
    uf   = UnionFind.new(size)
    uf.unit(0, 1)
    assert_equal 2, uf.size(0)
    assert_equal 2, uf.size(1)
    assert_equal 1, uf.size(2)
    uf.unit(3, 4)
    assert_equal 2, uf.size(0)
    assert_equal 2, uf.size(1)
    assert_equal 1, uf.size(2)
    assert_equal 2, uf.size(3)
    assert_equal 2, uf.size(4)
    uf.unit(4, 2)
    assert_equal 2, uf.size(0)
    assert_equal 2, uf.size(1)
    assert_equal 3, uf.size(2)
    assert_equal 3, uf.size(3)
    assert_equal 3, uf.size(4)
    uf.unit(1, 4)
    assert_equal 5, uf.size(0)
    assert_equal 5, uf.size(1)
    assert_equal 5, uf.size(2)
    assert_equal 5, uf.size(3)
    assert_equal 5, uf.size(4)
    uf.unit(1, 4)
    assert_equal 5, uf.size(0)
    assert_equal 5, uf.size(1)
    assert_equal 5, uf.size(2)
    assert_equal 5, uf.size(3)
    assert_equal 5, uf.size(4)
  end
end