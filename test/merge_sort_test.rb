require "merge_sort"

class SortingSuite::MergeSortTest < MiniTest::Test

  def test_sorts_empty_arrays
    assert_equal [], SortingSuite::MergeSort.new([]).sort
  end

  def test_sorts_one_element_arrays
    assert_equal [5], SortingSuite::MergeSort.new([5]).sort
  end

  def test_sorts_an_array_of_one_letter_strings
    assert_equal ["a", "b", "c", "d"], SortingSuite::MergeSort.new(["d", "b" ,"a" ,"c"]).sort
  end

  def test_sorts_a_small_array_of_numbers
    assert_equal [1, 2, 3], SortingSuite::MergeSort.new([3, 2, 1]).sort
  end

  def test_sorts_a_large_array_of_numbers
    assert_equal [1, 2, 3, 4, 5], SortingSuite::MergeSort.new([4, 2, 5, 3, 1]).sort
  end

  def test_sorts_arrays_that_are_in_reverse
    assert_equal [1, 2, 3, 4, 5], SortingSuite::MergeSort.new([5, 4, 3, 2, 1]).sort
  end

  def test_sorts_arrays_that_are_already_in_order
    assert_equal [1, 2, 3, 4, 5], SortingSuite::MergeSort.new([1, 2, 3, 4, 5]).sort
  end
end
