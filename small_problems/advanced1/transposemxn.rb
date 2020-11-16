def transpose(matrix)
  result = []
  result_cols = matrix.length
  result_rows = matrix.first.length
  result_rows.times do |row|
    new_row = result_cols.times.map do |column|
      matrix[column][row]
    end
    result << new_row
  end
  result
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]