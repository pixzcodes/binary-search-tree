
class Node
  attr_accessor :data, :left, :right
  def initialize (data, left, right)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root, :data

  def initialize array
    @data = array.sort.uniq
    @root = build_tree(@data) # build tree as soon as class is initiated 
  end

  def build_tree array
    return nil if array.empty? # base case
    array = array.uniq
    mid = array.length / 2
    data = array[mid]
    left = array[...mid]
    right = array[mid+1...]
    root_node = Node.new(data, left, right)
    root_node.left = build_tree(left) # start recursion for the left first so that it gets printed on the left
    root_node.right = build_tree(right)

    root_node

  end

  # This method came from a student on TheOdinProject Discord
  def pretty_print (node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end



end

arr = [4,56,2,4,14,7,8,9,3,1]
tree = Tree.new(arr)
tree.pretty_print



