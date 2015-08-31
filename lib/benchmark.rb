require_relative "bubble_sort"
require_relative "insertion_sort"
require_relative "merge_sort"

module SortingSuite
  class Benchmark

    def time(sort, array = [3, 2, 1])
      start = Time.now
      sort.new(array)
      seconds = Time.now - start
      puts "#{sort.to_s.gsub!("SortingSuite::", "")} took #{seconds} seconds"
      seconds
    end

    def timing(array, speed)
      times = {}
      winner = ""
      times[time(SortingSuite::BubbleSort, array)] = "BubbleSort"
      times[time(SortingSuite::InsertionSort, array)] = "InsertionSort"
      times[time(SortingSuite::MergeSort, array)] = "MergeSort"
      fastest_time = times.keys.sort.shift
      slowest_time = times.keys.sort.pop
      if speed == "fastest"
        winner = times[fastest_time]
      else
        winner = times[slowest_time]
      end
      puts "For the array #{array}, #{winner} is the #{speed}."
    end

    def fastest(array)
      timing(array, "fastest")
    end

    def slowest(array)
      timing(array, "slowest")
    end
  end
end

benchmark = SortingSuite::Benchmark.new
benchmark.time(SortingSuite::InsertionSort, [3,3,4,5,1])
benchmark.time(SortingSuite::MergeSort)
benchmark.fastest([2, 8, 1, 0, 5])
benchmark.slowest([1, 2, 3, 4, 5])
