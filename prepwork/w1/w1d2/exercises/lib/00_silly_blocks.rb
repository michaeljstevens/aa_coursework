def reverser(&prc)
  reversed = prc.call.split(" ")
  reversed.map { |word| word.reverse! }
  reversed.join(" ")
end

def adder(n = 1, &prc)
  prc.call + n
end

def repeater(num = 1)
  num.times { yield }
end
