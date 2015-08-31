module SortingSuite
  class InsertionSort
    attr_accessor :unsorted  # => nil

    def initialize(unsorted)
      @unsorted = unsorted    # => [3, 2, 1]
    end                       # => :initialize

    def sort
      pass = 0
      array_size = unsorted.length
      sorted = Array.new(array_size)
      while pass < (array_size)
        number = unsorted.shift
        index = 0
        while index < array_size
          if sorted[index].nil?
            sorted[index] = number
            break
          elsif number < sorted[index]
            sorted.insert(index, number)
            sorted.pop
            break
          else
            index += 1
          end
        end
        pass += 1
      end
      sorted
    end                                   # => :sort

    def inplace_sort                # ~> ArgumentError: wrong number of arguments (0 for 1)
      unsorted.each_index do |i|
        if i == 0
          number = unsorted[i]
        else
          index = 0
          while index < i
            if unsorted[i] < unsorted[index]
              number = unsorted.delete_at(i)
              unsorted.insert(index, number)
            end
          end
        end
      end
    end  # => :inplace_sort
  end    # => :inplace_sort
end      # => :inplace_sort

SortingSuite::InsertionSort.new([3, 2, 1]).inplace_sort

# ~> ArgumentError
# ~> wrong number of arguments (0 for 1)
# ~>
# ~> /Users/shannonpaige/code/sorting-suite/lib/insertion_sort.rb:33:in `inplace_sort'
# ~> /Users/shannonpaige/code/sorting-suite/lib/insertion_sort.rb:74:in `<main>'
