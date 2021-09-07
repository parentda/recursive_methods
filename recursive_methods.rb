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

def array_flatten(array, output = [])
  array.each do |item|
    item.is_a?(Array) ? array_flatten(item, output) : output << item
  end
  output
end

ROMAN_MAPPING = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

def int_to_roman(int, result = '', keys = ROMAN_MAPPING.keys)
  return result if int.zero?

  key = keys.shift
  quotient, modulus = int.divmod(key)
  result << ROMAN_MAPPING[key] * quotient
  int_to_roman(modulus, result, keys)
end
