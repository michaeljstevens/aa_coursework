def my_min_slow(list)
  list.each_with_index do |el1, idx1|
    list.each do |el2, idx2|
      unless idx1 == idx2
        next if el2 > el1
        el1
      end
    end
  end
end

def my_min(list)
  smallest = list.first
  list.drop(1).each do |el|
    smallest = el if el < smallest
  end
  smallest
end

def largest_contiguous_sum_slow(list)
  sums_arrays = []
  (0...list.length).to_a.each do |i|
    (i...list.length).to_a.each do |j|
      sub_sum = list[i..j].inject(:+)
      sums_arrays << sub_sum
    end
  end
  greatest_sum = sums_arrays[0].inject(:+)
  sums_arrays[1..-1].each do |array|
    array_sum = array.inject(:+)
    greatest_sum = array_sum if array_sum > greatest_sum
  end
  greatest_sum
end

def largest_contiguous_sum(list)
  sorted = list.sort.reverse # assuming O(nlogn) worst case
  sum = list.first
  return sum if sum <= 0
  list.drop(1).each do |num|
    break if num <= 0
    sum += num
  end
  sum
end

def app_academy_contiguous_sum(list)
  current = 0
  largest = 0

  list.each do |num|
    current += num
    largest = current if current > largest
    current = 0 if num < 0
  end
  
  largest
end
