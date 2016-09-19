class Array

  def bad_two_sum?(target)  # n squared
    self.each_with_index do |el1, i1|
      self.each_with_index do |el2, i2|
        return true if el1 + el2 == target && i1 != i2
      end
    end
    return false
  end

  def okay_two_sum?(target)
    sorted = self.sort   #nlogn assuming we used monkey patched sort method
    sorted.each_with_index do |num, i|
      duplicate = self.dup
      check_num = target - num
      duplicate.delete_at(i)
      return true if (duplicate).bsearch(check_num)
    end
    return false
  end

  def bsearch(check_num)
    return nil if self.empty?
    middle_idx = self.length / 2
    case check_num <=> self[middle_idx]
    when 0
      middle_idx
    when -1
      self.take(middle_idx).bsearch(check_num)
    when 1
      right = self.drop(middle_idx + 1).bsearch(check_num)
      return nil if right.nil?
      right + middle_idx + 1
    end
  end

  def two_sum?(target) #n
    sums_hash = Hash.new(0)
    self.each { |el| sums_hash[el] += 1 }
    sums_hash.each do |el, value|
      check_num = target - el
      if check_num == el
        return true if sums_hash[check_num] > 1
      else
        return true if sums_hash[check_num] > 0
      end
    end
    false
  end

end
