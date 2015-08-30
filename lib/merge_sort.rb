module SortingSuite
  class MergeSort
    attr_accessor :unsorted  # => nil

    def initialize(unsorted)
      @unsorted = unsorted    # => [3, 4, 2]
    end                       # => :initialize

    def sort
      merge_split(unsorted)  # => [2, 3, 4]
    end                      # => :sort

    def merge_split(unsorted)
      size = unsorted.length                                        # => 3, 1, 2, 1, 1
      midpoint = size/2                                             # => 1, 0, 1, 0, 0
      # half_array_size = size/2.to_f                     # => 1.5, 0.5, 1.0, 0.5, 0.5
      # l = half_array_size.floor                         # => 1, 0, 1, 0, 0
      # r = size - l                                      # => 2, 1, 1, 1, 1
      if size <= 1                                                  # => false, true, false, true, true
        unsorted                                                    # => [3], [4], [2]
      else
        unsorted.slice(0, midpoint)                                 # => [3], [4]
        unsorted.slice(midpoint, size-1)                            # => [4, 2], [2]
        left_half = merge_split(unsorted.slice(0, midpoint))        # => [3], [4]
        right_half = merge_split(unsorted.slice(midpoint, size-1))  # => [2], [2, 4]
        merge(left_half, right_half)                                # => [2, 4], [2, 3, 4]
      end                                                           # => [3], [4], [2], [2, 4], [2, 3, 4]
    end                                                             # => :merge_split

    def merge(left_half, right_half)
      sorted=[]                       # => [], []
      left_half                       # => [4], [3]
      right_half                      # => [2], [2, 4]
      ll = left_half.length           # => 1, 1
      rl = right_half.length          # => 1, 2
      i, j, k = 0,0,0                 # => [0, 0, 0], [0, 0, 0]

      while i < left_half.length && j < right_half.length        # => true, false, true, true, false
        right_half                                               # => [2], [2, 4], [2, 4]
        if left_half[i] < right_half[j]                          # => false, false, true
                    right_half                                   # => [2, 4]
          sorted[k]=left_half[i]                                 # => 3
                    right_half                                   # => [2, 4]
          i += 1                                                 # => 1
                    right_half                                   # => [2, 4]
          left_half                                              # => [3]
          right_half                                             # => [2, 4]
        else
          sorted[k]=right_half[j]                                # => 2, 2
          sorted                                                 # => [2], [2]
          j +=1                                                  # => 1, 1
          left_half                                              # => [4], [3]
          right_half                                             # => [2], [2, 4]
        end                                                      # => [2], [2, 4], [2, 4]
        k +=1                                                    # => 1, 1, 2
        left_half                                                # => [4], [3], [3]
        right_half                                               # => [2], [2, 4], [2, 4]
      end                                                        # => nil, nil
      if i >= left_half.length                                   # => false, true
        # take right[j] thru end and push into sorted
        sorted                                                   # => [2, 3]
        right_half                                               # => [2, 4]
        right_half[1]                                            # => 4
        left_half                                                # => [3]
        right_half[1]                                            # => 4
        sorted.push(right_half.slice(j, rl-1)).flatten!          # => [2, 3, 4]
      else
        sorted.push(left_half.shift(left_half.length)).flatten!  # => [2, 4]
      end                                                        # => [2, 4], [2, 3, 4]
      sorted                                                     # => [2, 4], [2, 3, 4]
    end                                                          # => :merge

  end                                      # => :merge
end                                        # => :merge
SortingSuite::MergeSort.new([3,4,2]).sort  # => [2, 3, 4]
