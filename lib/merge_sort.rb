module SortingSuite
  class MergeSort
    attr_accessor :unsorted  # => nil

    def initialize(unsorted)
      @unsorted = unsorted    # => [5, 3, 1, 2, 4]
    end                       # => :initialize

    def sort
      merge_split(unsorted)  # => [1, 2, 3, 4, 5]
    end                      # => :sort

    def merge_split(unsorted)
      size = unsorted.length                                            # => 5, 2, 1, 1, 3, 1, 2, 1, 1
      midpoint = size/2                                                 # => 2, 1, 0, 0, 1, 0, 1, 0, 0
      return unsorted if size <= 1 # base case for recursion
      unsorted.slice(0, midpoint)                                       # => [5, 3], [5], [1], [2]
      unsorted.slice(midpoint, size-midpoint)                           # => [1, 2, 4], [3], [2, 4], [4]
      left_half = merge_split unsorted.slice(0, midpoint)               # => [5], [3, 5], [1], [2]
      right_half = merge_split unsorted.slice(midpoint, size-midpoint)  # => [3], [4], [2, 4], [1, 2, 4]
      merge(left_half, right_half)                                      # => [3, 5], [2, 4], [1, 2, 4], [1, 2, 3, 4, 5]
    end                                                                 # => :merge_split

    def merge(left_half, right_half)
      sorted = []                                                     # => [], [], [], []
      i, j, k = 0,0,0                                                 # => [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]
      while i < left_half.length && j < right_half.length             # => true, false, true, false, true, false, true, true, true, true, false
        left_half[i]                                                  # => 5, 2, 1, 3, 3, 3, 5
        right_half[j]                                                 # => 3, 4, 2, 1, 2, 4, 4
        if left_half[i] < right_half[j]                               # => false, true, true, false, false, true, false
          sorted[k]=left_half[i]                                      # => 2, 1, 3
          i += 1                                                      # => 1, 1, 1
        else
          sorted[k]=right_half[j]                                     # => 3, 1, 2, 4
          sorted                                                      # => [3], [1], [1, 2], [1, 2, 3, 4]
          j +=1                                                       # => 1, 1, 2, 3
        end                                                           # => 1, 1, 1, 1, 2, 1, 3
        k +=1                                                         # => 1, 1, 1, 1, 2, 3, 4
      end                                                             # => nil, nil, nil, nil
      if i >= left_half.length                                        # => false, true, true, false
        sorted.push(right_half.slice(j, right_half.length)).flatten!  # => [2, 4], [1, 2, 4]
      else
        sorted.push(left_half.slice(i, left_half.length)).flatten!    # => [3, 5], [1, 2, 3, 4, 5]
      end                                                             # => [3, 5], [2, 4], [1, 2, 4], [1, 2, 3, 4, 5]
      sorted                                                          # => [3, 5], [2, 4], [1, 2, 4], [1, 2, 3, 4, 5]
    end                                                               # => :merge
  end                                                                 # => :merge
end                                                                   # => :merge
SortingSuite::MergeSort.new([5,3,1,2,4]).sort                         # => [1, 2, 3, 4, 5]
