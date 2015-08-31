module SortingSuite
  class Selection
    attr_accessor :unsorted  # => nil
    attr_accessor :sorted    # => nil

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
    end                                       # => :initialize
  end                                         # => :initialize
end                                           # => :initialize

# SortingSuite::Selection.new([3, 2, 1])  # => #<SortingSuite::Selection:0x007f9cfa878590 @unsorted=[3], @sorted=[1, 2, 3]>
SortingSuite::Selection.new(unsorted)  # ~> NameError: undefined local variable or method `unsorted' for main:Object

# ~> NameError
# ~> undefined local variable or method `unsorted' for main:Object
# ~>
# ~> /Users/shannonpaige/code/sorting-suite/lib/selection_sort.rb:35:in `<main>'
