require 'byebug'

def prime?(num)
  (2...num).each do |idx|
    if num % idx == 0
      return false
    end
  end
  true
end

def primes(num_primes)
  debugger

  ps = []
  num = 1
  while ps.count < num_primes
    ps << num if prime?(num)
  end
  ps
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
