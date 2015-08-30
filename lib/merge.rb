def merge(left_half, right_half)
  sorted = []                     # => []
  ll = left_half.length           # => 2
  rl = right_half.length          # => 2
  i, j, k = 1,1,1                 # => [1, 1, 1]

  while i < left_half.length && j < right_half.length  # => true, false
    if left_half[i] < right_half[j]                    # => true
      sorted.push(left_half.shift)                     # => ["b"]
      i += 1                                           # => 2
    else
      sorted.push(right_half.shift)
      j +=1
    end                                                # => 2
  end                                                  # => nil
  # if left_half.length == 0
  #   sorted.push(right_half.shift)
  # elsif right_half.length == 0
  #   sorted.push(left_half.shift)                               # => nil
  sorted                                               # => ["b"]
end                                                    # => :merge

merge(["b","d"],["z","k"])  # => ["b"]
