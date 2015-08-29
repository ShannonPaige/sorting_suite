require "bubble_sort"

class SortingSuite::BubbleSortTest < MiniTest::Test

  def test_empty_array_sorts
    assert_equal [], SortingSuite::BubbleSort.new([]).sort
  end

  def test_nonempty_array_sorts
    assert_equal [1,2,3,4,5], SortingSuite::BubbleSort.new([4,5,3,2,1]).sort
  end
end
