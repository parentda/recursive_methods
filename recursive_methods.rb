def factorial(n)
  return 1 if n == 1

  n * factorial(n - 1)
end

def palindrome?(string)
  return true if string.length <= 1

  string[0] == string[-1] ? palindrome?(string[1...-1]) : (return false)
end
