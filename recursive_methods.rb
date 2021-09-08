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

def fibs(num)
  fib_nums = [0, 1]
  if num < 2
    return fib_nums.slice(..num)
  else
    (num - 1).times { fib_nums << fib_nums[-1] + fib_nums[-2] }
  end
  fib_nums
end

def fibs_rec(num)
  if num < 2
    [0, 1].slice(..num)
  else
    fib_nums = fibs_rec(num - 1)
    fib_nums << fib_nums[-1] + fib_nums[-2]
  end
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

ROMAN_MAPPING2 = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

def roman_to_int(roman, result = 0)
  return result if roman.empty?

  ROMAN_MAPPING2.each_key do |numeral|
    if roman.start_with?(numeral)
      result += ROMAN_MAPPING2[numeral]
      return roman_to_int(roman[numeral.length..], result)
    end
  end
end

def merge_sort(array)
  return array if array.length <= 1

  left, right = array.each_slice((array.length / 2.0).round).to_a

  left = merge_sort(left) if left.length > 1
  right = merge_sort(right) if right.length > 1

  merge(left, right)
end

def merge(left, right)
  output = []

  while !left.empty? && !right.empty?
    left.first <= right.first ? output << left.shift : output << right.shift
  end

  output << left.shift while !left.empty?
  output << right.shift while !right.empty?

  output
end
