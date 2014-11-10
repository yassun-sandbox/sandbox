class Dog
  def bark
    puts 'wan!!'
  end
end

dog = Dog.new
bark_wan = dog.method(:bark)

# オーバライドしても影響しない。
class Dog
  def bark
    puts "bowwow!!"
  end
end

dog.bark
bark_wan.call

# 特異メソッドも関係ない。
def dog.bark
    puts "kyankyan!!"
end

dog.bark
bark_wan.call

