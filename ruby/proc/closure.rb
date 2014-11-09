def count
  cnt = 0
  ->(n){cnt += n }
end

closure = count
p closure.call(1)
p closure.call(10)
p closure.call(100)

