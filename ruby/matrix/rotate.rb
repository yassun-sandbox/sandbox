require "pp"

def rotate(matrix, n)
  for layer in 0..(n/2) - 1
      first = layer
      last = n - 1 - layer

      for i in first..last - 1

        offset = i - first

        # 上端の値を保存
        top = matrix[first][i]

        # 左端 → 上端
        matrix[first][i] = matrix[last - offset][first]

        # 下端 → 左端
        matrix[last - offset][first] = matrix[last][last - offset]

        # 右端 → 下端
        matrix[last][last - offset] = matrix[i][last]

        # 上端 → 右端
        matrix[i][last] = top
      end
  end
end

matrix = [
  [1,2,3,4],
  [1,2,3,4],
  [1,2,3,4],
  [1,2,3,4],
]

rotate(matrix, matrix.length)

