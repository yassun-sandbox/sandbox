class EvalTarget
end

t1 = EvalTarget.new
t2 = EvalTarget.new

# インスタンスメソッドとして定義されるパターン
EvalTarget.class_eval do
  def class_method
    puts "class_method"
  end
end

t1.class_method
t2.class_method

# 特異メソッドとして定義されるパターン
t1.instance_eval do
  def unique_method
    puts "unique_method"
  end
end

t1.unique_method
t2.unique_method

