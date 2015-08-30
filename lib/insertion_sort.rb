module SortingSuite
  class InsertionSort
    attr_accessor :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    def sort
      pass = 0
      array_size = unsorted.length
      sorted = Array.new(array_size)
      while pass < (array_size)
        number = unsorted.shift
        index = 0
        while index < array_size
          if sorted[index] == nil
            sorted[index] = number
            break
          elsif number < sorted[index]
            sorted.insert(index, number)
            sorted.pop
            sorted
            break
          else
            index += 1
          end
        end
      pass += 1
      sorted
      end
      sorted
    end

  end
end
