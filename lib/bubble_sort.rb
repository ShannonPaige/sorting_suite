module SortingSuite
  class BubbleSort
    attr_accessor :unsorted

    def initialize(unsorted)
      @unsorted = unsorted
    end

    # def sort
    #   (unsorted.count - 1).times do
    #     unsorted.each_index do |i|
    #       if i < (unsorted.count - 1)
    #         if unsorted[i] > unsorted[i + 1]
    #           bigger_number = unsorted.delete_at(i)
    #           unsorted.insert(i + 1, bigger_number)
    #         end
    #       end
    #     end
    #   end
    #   unsorted
    # end

    def sort
      (unsorted.length - 1).times do
        left_index = 0
        right_index = 1
        go_down_pass(left_index, right_index)
      end
      unsorted
    end

    def go_down_pass(left_index, right_index)
      (unsorted.length - 1).times do
        left_element = unsorted[left_index]
        right_element = unsorted[right_index]
        if left_element > right_element
          unsorted[left_index] = right_element
          unsorted[right_index] = left_element
        end
        left_index += 1
        right_index += 1
      end
    end

  end
end

SortingSuite::BubbleSort.new([4, 0, 3, 2, 1]).sort
