def my_uniq(array)
  uniq_array = []
  array.each { |el| uniq_array << el unless uniq_array.include?(el) }
  uniq_array
end

def two_sum(array)
  positions = []
  array.length.times do |idx|
    array.length.times do |jdx|
      unless idx == jdx
        if array[idx] + array[jdx] == 0
          positions << [idx, jdx] unless positions.include?( [jdx, idx] )
        end
      end
    end
  end
  positions
end

def my_transpose(arrays)
  transposed_arrays = []
  arrays.size.times do |idx|
    tmp = []
    arrays.each do |row|
      tmp << row[idx]
    end
    transposed_arrays << tmp
  end
  transposed_arrays
end

def stock_picker(stocks)
  days = []
  max_diff = 0
  stocks.each_with_index do |value,idx|
    stocks.each_with_index do |value1,idx1|
      next if idx >= idx1
      new_diff = value1 - value
      if new_diff > max_diff
        max_diff = new_diff
        days = [idx, idx1]
      end
    end
  end
  days
end
