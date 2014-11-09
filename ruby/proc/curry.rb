add = Proc.new {|x, y| x + y }
inc = add.curry.(1)
puts inc.(2)

append_prefix_atmark =  add.curry.("@")
puts append_prefix_atmark.("yasuun")

