require "merge_sort"

class SortingSuite::MergeSortTest < MiniTest::Test

  def test_empty_array_sorts
    assert_equal [], SortingSuite::MergeSort.new([]).sort
  end

  def test_sorts_a_small_array_of_numbers
    assert_equal [1,2,3], SortingSuite::MergeSort.new([3,2,1]).sort
  end

  def test_sorts_a_large_array_of_numbers
    assert_equal [1,2,3,4,5], SortingSuite::MergeSort.new([5,3,1,2,4]).sort
  end
end
