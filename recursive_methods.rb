def factorial(num)
  return 1 if num == 1

  num * factorial(num - 1)
end

def palindrome?(string)
  return true if string.length <= 1

  string[0] == string[-1] ? palindrome?(string[1...-1]) : (return false)
end

def bottles_of_beer(num)
  if num.zero?
    puts 'no more bottles of beer on the wall'
  else
    puts "#{num} bottles of beer on the wall"
    bottles_of_beer(num - 1)
  end
end

def fibonacci(num)
  return 0 if num == 0
  return 1 if num == 1

  fibonacci(num - 1) + fibonacci(num - 2)
end
