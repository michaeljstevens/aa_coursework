class Temperature

  def self.ftoc(temp)
    (temp - 32) * 5/9.to_f
  end

  def self.ctof(temp)
    (temp * 9/5.to_f) + 32
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

  def initialize(options)
    options[:f] ? fahrenheit(options[:f]) : celsius(options[:c])
  end

  def celsius(temp)
    @temperature = temp
    @@origin_unit = "C"
  end

  def fahrenheit(temp)
    @temperature = temp
    @@origin_unit = "F"
  end

  def in_fahrenheit
    return @temperature if @@origin_unit == "F"
    self.class.ctof(@temperature)
  end

  def in_celsius
    return @temperature if @@origin_unit == "C"
    self.class.ftoc(@temperature)
  end
end

class Celsius < Temperature
  def initialize(temp)
    self.celsius(temp)
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit(temp)
  end
end
