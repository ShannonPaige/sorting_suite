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
    end

    # def inplace_sort
    #   pass = 0
    #   array_size = unsorted.length
    #   number = unsorted[0]
    #   while pass < (array_size)
    #     index = 0
    #     while index < array_size
    #       if unsorted[index] > unsorted[index+1]
    #         number = unsorted.delete_at(index)
    #         unsorted.insert(pass, number)
    #         break
    #       else
    #         index += 1
    #       end
    #     end
    #     pass += 1
    #   end
    #   unsorted
    # end

    # def inplace_sort
    #   unsorted.each_index do |i|
    #     if i == 0
    #       number = unsorted[i]
    #     else
    #       index = 0
    #       while index < i
    #         if unsorted[i] < unsorted[index]
    #           number = unsorted.delete_at(i)
    #           unsorted.insert(index, number)
    #         end
    #       end
    #     end
    #   end
    # end                                       # => :inplace_sort
  end
end

#SortingSuite::InsertionSort.new([3,1,2, 7,3,4,9,2]).inplace_sort
