module SortingSuite
  class MergeSort
    attr_accessor :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    def sort
      merge_split(unsorted)
    end

    def merge_split(unsorted)
      size = unsorted.length
      midpoint = size / 2
      return unsorted if size <= 1 # base case for recursion
      unsorted.slice(0, midpoint)
      unsorted.slice(midpoint, size - midpoint)
      left_half = merge_split unsorted.slice(0, midpoint)
      right_half = merge_split unsorted.slice(midpoint, size - midpoint)
      merge(left_half, right_half)
    end

    def merge(left_half, right_half)
      sorted = []
      i = 0
      j = 0
      k = 0
      while i < left_half.length && j < right_half.length
        if left_half[i] < right_half[j]
          sorted[k] = left_half[i]
          i += 1
        else
          sorted[k] = right_half[j]
          j += 1
        end
        k += 1
      end
      if i >= left_half.length
        sorted.push(right_half.slice(j, right_half.length)).flatten!
      else
        sorted.push(left_half.slice(i, left_half.length)).flatten!
      end
      sorted
    end
  end
end
