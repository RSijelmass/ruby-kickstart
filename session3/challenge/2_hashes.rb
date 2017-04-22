# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(num)
    hash = {};  nums = Array(1..num); evens = []
    nums.each do |n|
      evens << n if n % 2 == 0
      hash[n] = evens.select{ |even| even < n} if n % 2 != 0
    end
    hash
end
