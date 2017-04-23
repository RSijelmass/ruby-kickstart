# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(square, i = 0, &block)
  col_min = i;   col_max = (square.first.length - 1)
  row_min = i;   row_max = (square.length - 1)

  #check when loop should end
  return if col_max / 2 < i || row_max / 2 < i

  #push top row
  col_min.upto(col_max-i){ |col| block.call square[row_min][col] }

  #push right column
  (row_min+1).upto(row_max-i){ |row| block.call square[row][col_max-i] }

  #push last row
  (col_max-1-i).downto(col_min){ |col| block.call square[row_max-i][col]}

  #push left column
  (row_max-1-i).downto(row_min+1){ |row| block.call square[row][col_min]}

  #recursion with i+= 1
  spiral_access(square, i+=1, &block)
end


# The code I wrote originally:
# def spiral_access(square, &block)
#   sorted = []
#   if square.length > 1
#     square.each do |rows|
#         rows.each { |col| sorted << col }
#     end
#   else
#     sorted = square
#   end
#   p sorted.sort
# end
