require './lib/binary-search-tree'


# Driver script:

# Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
node = Tree.new(Array.new(15) { rand(1..100) })

# Confirm that the tree is balanced by calling #balanced?
puts "The tree is " + (node.balanced ? "balanced" : "unbalnced")

# Print out all elements in level, pre, post, and in order
puts "Preorder: #{node.preorder.join(',')}"
puts "Postorder: #{node.postorder.join(',')}"
puts "Inorder: #{node.inorder.join(',')}"

# Unbalance the tree by adding several numbers > 100
5.times do
  node.insert(rand(100...1000))
end

# Confirm that the tree is unbalanced by calling #balanced?
puts "The tree is " + (node.balanced ? "balanced" : "unbalnced")

# Balance the tree by calling #rebalance
node.rebalance

# Confirm that the tree is balanced by calling #balanced?
puts "The tree is " + (node.balanced ? "balanced" : "unbalnced")

# Print out all elements in level, pre, post, and in order
puts "Preorder: #{node.preorder.join(',')}"
puts "Postorder: #{node.postorder.join(',')}"
puts "Inorder: #{node.inorder.join(',')}"






# node = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

# node.insert(2)
# node.insert(10)
# node.insert(2)
# node.insert(6999)
# node.pretty_print
# node.delete(4)
# node.pretty_print



# print node.inorder
# print "\n"
# print node.preorder
# print "\n"
# print node.postorder
# print "\n"
# print node.inorder { |value| value <= 10}
# print "\n"
# print node.preorder { |value| value <= 10}
# print "\n"
# print node.postorder { |value| value <= 10}

# puts node.height

# puts "The depth of node : #{node.root.left_node.left_node.right_node.data} is #{node.depth(node.root.left_node.left_node.right_node)}"




