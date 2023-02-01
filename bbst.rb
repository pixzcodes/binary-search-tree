
class Node
  attr_accessor :data, :left, :right
  def initialize (data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
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

  def insert (value, node = @root)
    return nil if value == node.data # return nil if value already exists

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end
  
  def delete (value, node = @root)
    return node if node.nil? 

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # if the node has one or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      far_left_node = far_left_leaf(node.right)
      node.data = far_left_node.data
      node.right = delete(far_left_node.data, node.right)
    end
    node
  end

  def far_left_leaf node
    node = node.left until node.left.nil?

    node
  end

  def find (value, node = @root)
    return node if node.nil? || node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

end

arr = [4,56,2,4,14,7,8,9,3,1]
tree = Tree.new(arr)
tree.pretty_print

puts "insert"
tree.insert(12)
tree.pretty_print

puts "delete 12"
tree.delete(12)
tree.pretty_print
puts "delete 2"
tree.delete(2)
tree.pretty_print
puts "delete 14"
tree.delete(14)
tree.pretty_print

puts "find 4"
p tree.find(4)

