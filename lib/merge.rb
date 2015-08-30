def merge(left_half, right_half)
  sorted = []
  while left_half.length != 0 && right_half.length !=0
    if left_half[i] < right_half[j]
      sorted.push(left_half.shift)
    else
      sorted.push(right_half.shift)
    end
  end
  if left_half.length == 0
    sorted.push(right_half.shift) #need to push the whole array in, not just one element
  else right_half.length == 0
    sorted.push(left_half.shift)
  end
  sorted
end

merge(["b","d"],["z","k"])
