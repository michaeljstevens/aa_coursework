class Fixnum

  def ones_number(num)
    ones = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
    }
    ones[num]
  end

  def teen_number(num)
    teens = {
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen"
    }
    teens[num]
  end

  def tens_number(num)
    tens = {
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }
    tens[num]
  end

  def in_words
    number_array = self.to_s.split("").reverse
    numberstring = []
    until number_array == []
      num = number_array[-1].to_i
      case number_array.length
      when 1
        numberstring << ones_number(num) unless numberstring != [] && num == 0
        number_array.pop
      when 2
        if number_array.join("").reverse.to_i.between?(10, 19)
          numberstring << teen_number(number_array.join("").reverse.to_i)
          break
        end
        numberstring << tens_number(num) unless num == 0
        number_array.pop
      when 3
        numberstring += [ones_number(num), "hundred"] unless num == 0
        number_array.pop
      when 4
        numberstring += [ones_number(num), "thousand"] unless num == 0
        number_array.pop
      when 5
        if num == 1
          teen_num = [num, number_array[-2]].join("").to_i
          numberstring += [teen_number(teen_num), "thousand"]
          number_array.pop
          number_array.pop
        elsif num != 0
          numberstring << tens_number(num)
          numberstring << "thousand" if number_array[-2].to_i == 0
          number_array.pop
        else
          number_array.pop
        end
      when 6
        numberstring += [ones_number(num), "hundred"] unless num == 0
        number_array.pop
      when 7
        numberstring += [ones_number(num), "million"] unless num == 0
        number_array.pop
      when 8
        if num == 1
          teen_num = [num, number_array[-2]].join("").to_i
          numberstring += [teen_number(teen_num), "million"]
          number_array.pop
          number_array.pop
        elsif num != 0
          numberstring << tens_number(num)
          numberstring << "million" if number_array[-2].to_i == 0
          number_array.pop
        else
          number_array.pop
        end
      when 9
        numberstring += [ones_number(num), "hundred"] unless num == 0
        number_array.pop
      when 10
        numberstring += [ones_number(num), "billion"] unless num == 0
        number_array.pop
      when 11
        if num == 1
          teen_num = [num, number_array[-2]].join("").to_i
          numberstring += [teen_number(teen_num), "billion"]
          number_array.pop
          number_array.pop
        elsif num != 0
          numberstring << tens_number(num)
          numberstring << "billion" if number_array[-2].to_i == 0
          number_array.pop
        else
          number_array.pop
        end
      when 12
        numberstring += [ones_number(num), "hundred"] unless num == 0
        number_array.pop
      when 13
        numberstring += [ones_number(num), "trillion"] unless num == 0
        number_array.pop
      when 14
        if num == 1
          teen_num = [num, number_array[-2]].join("").to_i
          numberstring += [teen_number(teen_num), "trillion"]
          number_array.pop
          number_array.pop
        elsif num != 0
          numberstring << tens_number(num)
          numberstring << "trillion" if number_array[-2].to_i == 0
          number_array.pop
        else
          number_array.pop
        end
      when 15
        numberstring += [ones_number(num), "hundred"] unless num == 0
        number_array.pop
      else
        "invalid input #{self}"
      end
    end
    numberstring.join(" ")
  end
end
