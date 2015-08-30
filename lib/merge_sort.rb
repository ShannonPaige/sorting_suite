module SortingSuite
  class MergeSort
    attr_accessor :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    def sort
      if unsorted.size == 1 || unsorted.empty?
        unsorted
      else
        merge_split(unsorted)
      end
    end

    def merge_split(unsorted)
      half_array_size = unsorted.length/2.to_f
      midpoint = half_array_size.ceil
      if unsorted.length > 1
        left_half = unsorted.slice(0, midpoint)
        right_half = unsorted.slice(midpoint, midpoint)
        merge_split(left_half)
        merge_split(right_half)
        #merge(merge_split(left_half), merge_split(right_half))
        merge(left_half, right_half)
      end
    end

    def merge(left_half, right_half)
      sorted = []
      while left_half.length != 0 || right_half.length !=0
        if left_half.length == 0
          sorted.push(right_half.shift)
        elsif right_half.length == 0
          sorted.push(left_half.shift)
        elsif left_half[0] < right_half[0]
          sorted.push(left_half.shift)
        else
          sorted.push(right_half.shift)
        end
      end
      sorted
    end

  end
end
SortingSuite::MergeSort.new(["a","b","c","d","e","f","g"]).sort
