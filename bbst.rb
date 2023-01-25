# Pseudo-code #
# - First check for duplicates and remove them
# - Then find the middle of the array and make it the root
# - assign the left of the array to the left of the root
# - repeat with recursion
# - and same with the right array
# - build out tree using recursion 

class Node
  attr_accessor :data, :left, :right
  def initialize (data, left, right)
    @data = data
    @left = left
    @right = right
  end
end




