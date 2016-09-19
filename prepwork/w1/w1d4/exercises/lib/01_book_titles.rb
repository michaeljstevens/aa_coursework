class Book

  attr_accessor :title

  def title
    title_array = @title.split(" ")
    result = []
    title_array.each_with_index.map do |word, index|
      little_words = %w(a an and in the of)
      if index == 0
        result << word.capitalize
      else
        little_words.include?(word) ? result << word : result << word.capitalize
      end
    end
    result.join(" ")
  end
end
