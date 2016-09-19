def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  result = 0
  arr.each{ |n| result += n }
  result
end

def multiply(arr)
  result = 1
  arr.each{ |n| result *= n }
  result
end

def power(a, b)
  a ** b
end

def factorial(num)
  return 1 if num == 0
  return num * factorial(num - 1)
end
