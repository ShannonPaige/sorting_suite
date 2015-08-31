module SortingSuite
  class Selection
    attr_accessor :unsorted
    attr_accessor :sorted

    def initialize(unsorted = [0, 1, 2, 3, 4])
      @unsorted = unsorted
      pass = 0
      index = 0
      array_size = unsorted.length
      @sorted = Array.new(array_size)
      number = unsorted[0]
      while pass < array_size
        number = unsorted[0]
        unsorted.each_index do |i|
          if unsorted[i] < number
            number = unsorted[i]
            index = i
          end
        end
        pass
        sorted.insert(pass, number)
        sorted.pop
        sorted
        unsorted.delete_at(index)
        unsorted
        pass += 1
      end
      p sorted
    end
  end
end

SortingSuite::Selection.new([3, 2, 1])
array = [4, 0, 2, 3, 1]
SortingSuite::Selection.new(array)
