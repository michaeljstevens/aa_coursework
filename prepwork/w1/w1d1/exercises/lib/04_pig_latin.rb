def translate(string)
  word_array = string.split(" ")
  vowels = ['a', 'e', 'i', 'o', 'u']
  result = []

  word_array.each do |s|
    word = s.split("")

    unless vowels.include?(word[0])
      count = 0
      word.each_with_index do |i, index|
        if i == "u" && word[index - 1] == "q"
          count += 1
        else
          count += 1 unless vowels.include?(i)
        end
        break if vowels.include?(i) unless i == "u" && word[index - 1] == "q"
      end
      word = word.rotate(count)
    end
    word << "ay"
    result << word.join("")
  end
  puts result.join(" ")
  result.join(" ")
end

translate("apple")
translate("quiet")
translate("desktop")
translate("square")
