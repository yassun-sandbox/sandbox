e = Enumerator.new do |yielder|
  a = 0; b = 1
  loop do
    a, b = b, a + b

    # 引数
    yielder << a
  end
end

e.each do |i|
  break if i > 100
  puts i
end

