module SortingSuite
  class MergeSort
    attr_accessor :unsorted  # => nil

    def initialize(unsorted)
      @unsorted = unsorted    # => ["d", "z", "f", "g", "y"]
    end                       # => :initialize

    def sort
      if unsorted.size == 1 || unsorted.empty?  # => false
        unsorted
      else
        merge_split(unsorted.length, unsorted)  # => ["g"]
      end                                       # => ["g"]
    end                                         # => :sort

    def merge_split(size, unsorted)
      half_array_size = size/2.to_f               # => 2.5, 1.5, 1.0, 0.5, 0.5, 0.5, 1.0, 0.5, 0.5
      r = half_array_size.floor                   # => 2, 1, 1, 0, 0, 0, 1, 0, 0
      l = size - r                                # => 3, 2, 1, 1, 1, 1, 1, 1, 1
      if size > 1                                 # => true, true, true, false, false, false, true, false, false
        left_half = unsorted.slice(0, l)          # => ["d", "z", "f"], ["d", "z"], ["d"], ["g"]
        right_half = unsorted.slice(l, r)         # => ["g", "y"], ["f"], ["z"], ["y"]
        merge_split(left_half.size,left_half)     # => nil, [], [], nil
        merge_split(right_half.size, right_half)  # => nil, nil, nil, []
        merge(left_half, right_half)              # => [], [], [], ["g"]
      end                                         # => nil, nil, [], nil, [], nil, nil, [], ["g"]
    end                                           # => :merge_split

    def merge(left_half, right_half)
      sorted = []                        # => [], [], [], []
      ll = left_half.length              # => 1, 2, 1, 3
      rl = right_half.length             # => 1, 1, 1, 2
      i, j, k = 1,1,1                    # => [1, 1, 1], [1, 1, 1], [1, 1, 1], [1, 1, 1]
      # if left_half.length == 0
      #   sorted.push(right_half.shift)
      # elsif right_half.length == 0
      #   sorted.push(left_half.shift)
      while i<ll && j<rl                 # => false, false, false, true, false
        if left_half[i] < right_half[j]  # => false
          sorted.push(left_half.shift)
          i += 1
        else
          sorted.push(right_half.shift)  # => ["g"]
          j +=1                          # => 2
        end                              # => 2
      end                                # => nil, nil, nil, nil
      sorted                             # => [], [], [], ["g"]
    end                                  # => :merge

  end                                                    # => :merge
end                                                      # => :merge
SortingSuite::MergeSort.new(["d","z","f","g","y"]).sort  # => ["g"]
