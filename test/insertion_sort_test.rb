require "insertion_sort"

class SortingSuite::InsertionSortTest < MiniTest::Test

  def test_empty_array_sorts
    assert_equal [], SortingSuite::InsertionSort.new([]).sort
  end

  def test_first_challenge_passes
    assert_equal [1,2,3], SortingSuite::InsertionSort.new([3,2,1]).sort
  end

  def test_second_challenge_passes
    assert_equal [1,2,3,4,5], SortingSuite::InsertionSort.new([2,5,4,1,3]).sort
  end
end
