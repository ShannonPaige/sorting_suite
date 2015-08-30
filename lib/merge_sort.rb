module SortingSuite
  class MergeSort
    attr_accessor :unsorted  # => nil

    def initialize(unsorted)
      @unsorted = unsorted    # => [1, 2, 3, 9, 7, 6]
    end                       # => :initialize

    def sort
      merge_split(unsorted)  # => [1, 2, 3, 6, 7, 9]
    end                      # => :sort

    def merge_split(unsorted)
      size = unsorted.length   # => 6, 3, 1, 2, 1, 1, 3, 1, 2, 1, 1
      midpoint = size/2        # => 3, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0

      #base case
      return unsorted if size <= 1  # => false, false, true, false, true, true, false, true, false, true, true

      #general pattern
      unsorted.slice(0, midpoint)                                       # => [1, 2, 3], [1], [2], [9], [7]
      unsorted.slice(midpoint, size-midpoint)                           # => [9, 7, 6], [2, 3], [3], [7, 6], [6]
      left_half = merge_split unsorted.slice(0, midpoint)               # => [1], [2], [1, 2, 3], [9], [7]
      right_half = merge_split unsorted.slice(midpoint, size-midpoint)  # => [3], [2, 3], [6], [6, 7], [6, 7, 9]

      # merge(left_half, right_half)
      sorted = []      # => [], [], [], [], []
      i, j, k = 0,0,0  # => [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]

      while i < left_half.length && j < right_half.length             # => true, false, true, false, true, false, true, true, false, true, true, true, false
        left_half[i]                                                  # => 2, 1, 7, 9, 9, 1, 2, 3
        right_half[j]                                                 # => 3, 2, 6, 6, 7, 6, 6, 6
        if left_half[i] < right_half[j]                               # => true, true, false, false, false, true, true, true
          sorted[k]=left_half[i]                                      # => 2, 1, 1, 2, 3
          i += 1                                                      # => 1, 1, 1, 2, 3
        else
          sorted[k]=right_half[j]                                     # => 6, 6, 7
          sorted                                                      # => [6], [6], [6, 7]
          j +=1                                                       # => 1, 1, 2
        end                                                           # => 1, 1, 1, 1, 2, 1, 2, 3
        k +=1                                                         # => 1, 1, 1, 1, 2, 1, 2, 3
      end                                                             # => nil, nil, nil, nil, nil
      if i >= left_half.length                                        # => true, true, false, false, true
        sorted.push(right_half.slice(j, right_half.length)).flatten!  # => [2, 3], [1, 2, 3], [1, 2, 3, 6, 7, 9]
      else
        sorted.push(left_half.shift(left_half.length)).flatten!       # => [6, 7], [6, 7, 9]
      end                                                             # => [2, 3], [1, 2, 3], [6, 7], [6, 7, 9], [1, 2, 3, 6, 7, 9]
      sorted                                                          # => [2, 3], [1, 2, 3], [6, 7], [6, 7, 9], [1, 2, 3, 6, 7, 9]
    end                                                               # => :merge_split

    # def merge(left_half, right_half)
    #   left_half
    #   right_half
    #   sorted = []
    #   ll = left_half.length
    #   rl = right_half.length
    #   i, j, k = 0,0,0
    #
    #   while i < left_half.length && j < right_half.length
    #     if left_half[i] < right_half[j]
    #       sorted[k]=left_half[i]
    #       i += 1
    #     else
    #       sorted[k]=right_half[j]
    #       sorted
    #       j +=1
    #     end
    #     k +=1
    #   end
    #   if i >= left_half.length
    #     sorted
    #     sorted.push(right_half.slice(j, rl-1)).flatten!
    #   else
    #     sorted.push(left_half.shift(left_half.length)).flatten!
    #   end
    #   sorted
    # end                                                          # => :merge

  end                                            # => :merge_split
end                                              # => :merge_split
SortingSuite::MergeSort.new([1,2,3,9,7,6]).sort  # => [1, 2, 3, 6, 7, 9]
