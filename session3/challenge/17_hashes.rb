# Print to stdout, each element in a hash based linked list, in reverse.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
#
# print_list_in_reverse head   # >> "1\n2\n"

def print_list_in_reverse(linked, arr = [])
  puts (arr << linked[:data]).reverse if linked[:next] == nil

  arr << linked[:data]
  print_list_in_reverse(linked[:next], arr) if linked[:next].is_a? Hash
end
