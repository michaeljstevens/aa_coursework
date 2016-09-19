def windowed_max_range(array, window)
  current_max_range = nil

  (0..array.length - window).each do |i| #n^3
    range = array[i...i + window]
    possible_max = (range.max) - (range.min)
    current_max_range = possible_max if current_max_range.nil?
    current_max_range = possible_max if possible_max > current_max_range
  end

  current_max_range

end



windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
