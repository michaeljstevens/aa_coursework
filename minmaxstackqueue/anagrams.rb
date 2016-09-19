class String

  def first_anagram?(second_string)
    possibilities = self.split("").permutation.to_a.map(&:join)
    possibilities.include?(second_string)
  end

  def second_anagram?(second_string)
    first_array = self.split("")
    second_array = second_string.split("")
    until first_array.empty? || second_array.empty?
      if second_array.include?(first_array.first)
        second_array.delete(first_array.first)
        first_array.shift
      else
        return false
      end
    end
    return true
  end

  def third_anagram?(second_string)
    self.split("").sort == second_string.split("").sort
  end

  def fourth_anagram?(second_string)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    self.split("").each {|l| hash1[l]+=1}
    second_string.split("").each {|l| hash2[l]+=1}
    hash1 == hash2
  end

end
