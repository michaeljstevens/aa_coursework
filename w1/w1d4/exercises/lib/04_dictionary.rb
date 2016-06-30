class Dictionary
  attr_reader :entries

  def initialize
    @dict_hash = {}
  end

  def add(options)
    if options.is_a?(String)
      @dict_hash[options] = nil
    else
      @dict_hash.merge!(options)
    end
  end

  def entries
    @dict_hash
  end

  def keywords
    @dict_hash.keys.sort
  end

  def include?(keyword)
    @dict_hash.each do |key, value|
      return true if key == keyword
      next
    end
    false
  end

  def find(word)
    prefix = word.length - 1
    found = {}
    @dict_hash.each do |key, value|
      found[key] = value if word == key[0 .. prefix]
    end
    found
  end

  def printable
    entries = keywords.map do |key|
      %Q{[#{key}] "#{@dict_hash[key]}"}
    end
    entries.join("\n")
  end
end
