def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, n = 2)
  i = 1
  result = "#{word}"
  until i == n
    result += " #{word}"
    i += 1
  end
  result
end

def start_of_word(word, n)
  result = ""
  (0 .. n - 1).each { |l| result += word[l] }
  result
end

def first_word(string)
  words = string.split(" ")
  words[0]
end

def titleize(string)
  result = []
  words = string.split(" ")
  little_words = ["and", "over", "the", "a"]
  words.each_with_index do |word, index|
    if little_words.include?(word)
      if index == 0
        result << word.capitalize
      else
        result << word
      end
    else
      result << word.capitalize
    end
  end
  result.join(" ")
end
