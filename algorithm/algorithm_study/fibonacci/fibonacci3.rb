fibonacci = proc do 
  a = 0; b = 1
  lambda do
    a, b = b, a + b
    return a
  end
end.call() # procの実行

loop do
  # lambdaを実行
  i = fibonacci.()
  break if i > 100
  puts i
end
