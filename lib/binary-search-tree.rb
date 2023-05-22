module Comparable;end


class Node
  attr_accessor :data, :left_node, :right_node

  def initialize(data, left_node = nil, right_node = nil)
    @data = data
    @left_node = left_node
    @right_node = right_node
  end

  def value
    return @data
  end
end


class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array.uniq.sort
    @root = self.build_tree(@array, 0, @array.length - 1)
  end

# A function that constructs Balanced Binary Search Tree from a sorted array
def build_tree(array, start, last)
  return if start > last

  mid = ((start + last) / 2).to_i

  root_node = Node.new(array[mid]) if array[mid].to_i != nil

  root_node.left_node = build_tree(array, start, mid - 1)
  root_node.right_node = build_tree(array, mid + 1, last)

  root_node
end



def insert(value, root_node = @root)
  # base case, when nil is encountered

  if root_node == nil
    return Node.new(value)
  else
      root_node.left_node = insert(value, root_node.left_node) if root_node.data > value
      root_node.right_node = insert(value, root_node.right_node) if root_node.data < value
  end
  @root = root_node
end

def inorder(root_node = @root)
  # base case, when nil is encountered
    # base case
  if root_node == nil
  inorder(root_node.left_node)
  puts "#{root_node.data}, "
  inorder(root_node.right_node)
  end
end

def succesory(root_node = @root)

  max_node = root_node

  until max_node.right_node == nil do
    max_node = max_node.right_node
  end
  max_node.data
end

def predecessory(root_node = @root)

  min_node = root_node

  until min_node.left_node == nil do
    min_node = min_node.left_node
  end
  min_node.data
end


def delete(value, root_node = @root)


  # no child nodes
  return nil if root_node.left_node.nil? && root_node.right_node.nil?


  #recurse into child nodes
  if root_node.data > value
    root_node.left_node = delete(value, root_node.left_node)
  elsif root_node.data < value
    root_node.right_node = delete(value, root_node.right_node)
  end


  p root_node.data

  # one child node
  return root_node.right_node if root_node.left_node.nil? && root_node.right_node && root_node.data == value
  return root_node.left_node if root_node.right_node.nil? && root_node.left_node && root_node.data == value

# 2 child nodes
# succesor
  succesor_node = succesory(root_node.right_node) if root_node.right_node && root_node.left_node && root_node.data == value
  root_node.data = succesor_node if root_node.right_node && root_node.left_node && root_node.data == value
  root_node.right_node = delete(succesor_node, root_node.right_node) if root_node.right_node && root_node.left_node && root_node.data == succesor_node

# or predecessor
  succesor_node = succesory(root_node.right_node) if root_node.right_node && root_node.left_node && root_node.data == value
  root_node.data = succesor_node if root_node.right_node && root_node.left_node && root_node.data == value
  root_node.right_node = delete(succesor_node, root_node.right_node) if root_node.right_node && root_node.left_node && root_node.data == succesor_node


  root_node



end




  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end
end


node = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

node.insert(2)
node.insert(10)
node.insert(2)
node.insert(6999)
node.pretty_print
node.delete(4)



node.pretty_print
