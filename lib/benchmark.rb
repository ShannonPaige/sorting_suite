require_relative "bubble_sort"     # => true
require_relative "insertion_sort"  # => true
require_relative "merge_sort"      # => true

module SortingSuite
  class Benchmark

    def time(sort, array = [3, 2, 1])
      start = Time.now                                                         # => 2015-08-30 17:21:14 -0600, 2015-08-30 17:21:14 -0600
      sort.new(array)                                                          # => #<SortingSuite::InsertionSort:0x007fdb61038d58 @unsorted=[3, 3, 4, 5, 1]>, #<SortingSuite::MergeSort:0x007fdb61033fb0 @unsorted=[3, 2, 1]>
      seconds = start - Time.now                                               # => -0.000146, -0.000282
      puts "#{sort.to_s.gsub!("SortingSuite::", "")} took #{seconds} seconds"  # => nil, nil
      seconds                                                                  # => -0.000146, -0.000282
    end                                                                        # => :time

    def fastest(array)

      bubble_time = benchmark.time(SortingSuite::BubbleSort, array)        # ~> NameError: undefined local variable or method `benchmark' for #<SortingSuite::Benchmark:0x007fdb61039208>
      # insertion_time = benchmark.time(SortingSuite::InsertionSort, array)
      # merge_time = benchmark.time(SortingSuite::MergeSort, array)
      # if bubble_time < insertion_time
      #   if insertion_time < merge_time
      #     fastest = merge_time
      #   else
      #     fastest = bubble_time
      #   end
      # else
      #   if bubble_time < merge_time
      #     fastest = merge_time
      #   else
      #     fastest = bubble_time
      #   end
      # end
      # puts "#{fastest} is the fastest"
    end                                                                    # => :fastest

    def slowest(array)
      puts "...is the slowest"
    end                         # => :slowest
  end                           # => :slowest
end                             # => :slowest

benchmark = SortingSuite::Benchmark.new                   # => #<SortingSuite::Benchmark:0x007fdb61039208>
benchmark.time(SortingSuite::InsertionSort, [3,3,4,5,1])  # => -0.000146
benchmark.time(SortingSuite::MergeSort)                   # => -0.000282
benchmark.fastest([2, 8, 1, 0, 5])

# >> InsertionSort took -0.000146 seconds
# >> MergeSort took -0.000282 seconds

# ~> NameError
# ~> undefined local variable or method `benchmark' for #<SortingSuite::Benchmark:0x007fdb61039208>
# ~>
# ~> /Users/shannonpaige/code/sorting-suite/lib/benchmark.rb:17:in `fastest'
# ~> /Users/shannonpaige/code/sorting-suite/lib/benchmark.rb:45:in `<main>'
