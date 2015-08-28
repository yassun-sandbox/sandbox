def fib1(n)
  return n if n <= 1
  return fib1(n-1) + fib1(n-2)
end

(0..30).each do |n|
  puts fib1(n)
end

