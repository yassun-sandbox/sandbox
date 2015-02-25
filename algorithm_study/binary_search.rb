# 二分探索

# puts vs.bsearch{|n| n == 75 }
# rightは配列サイズ
# leftは添字位置

# left + 1 < right の関係を満たさなくなるのは
# leftが指し示している添え字位置が配列のMAXである場合

def contains?(v, vs)
  return false if vs.length == 0

  left  = 0
  right = vs.length

  while left + 1 < right
    m = left + (right - left) / 2
    if v < vs[m]
      right = m
    else
      left = m
    end
  end

  return vs[left] == v

end

vs = [1,3,9,12,20,34,70,75,83]
[1,2,83].each { |v| print "#{v} #{contains?(v, vs)} \n\n" }

def contains2?(v, vs)

  left  = 0
  right = vs.length

  while left <= right do
    mid = (left + right) / 2
    if vs[mid] == v
      return "Found!:#{mid}"
    elsif vs[mid] < v
      left = mid + 1
    else
      right = mid - 1
    end
  end

end

vs = [1,3,9,12,20,34,70,75,83]
[1,34,83].each { |v| print "#{v} #{contains2?(v, vs)} \n\n" }

