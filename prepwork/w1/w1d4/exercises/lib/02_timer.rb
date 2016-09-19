class Timer

  def initialize(seconds = 0)
    @seconds = seconds
  end

  attr_accessor :seconds

  def padded(time)
    time > 9 ? time.to_s : "0#{time}"
  end

  def seconds
    @seconds
  end

  def time_string
    hours = 0
    minutes = 0

    until @seconds < 60
      minutes += 1
      @seconds -= 60
    end

    until minutes < 60
      hours += 1
      minutes -= 60
    end
    "#{padded(hours)}:#{padded(minutes)}:#{padded(@seconds)}"
  end

end
