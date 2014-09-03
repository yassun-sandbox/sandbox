def generate_default_value
  p 'default value genereted'
  return 'default value'
end

def some_method(param = nil)
  param ||= generate_default_value
  # hogehoge hugahuga
end


some_method()
some_method(true)
