matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


def transpose(matrix)
  transposed = [[], [], []]
  matrix.each do |row|
    transposed[0] << row[0]
    transposed[1] << row[1]
    transposed[2] << row[2]
  end
  transposed
end



new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]