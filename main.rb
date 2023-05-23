require './lib/binary-search-tree'



node = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

node.insert(2)
node.insert(10)
node.insert(2)
node.insert(6999)
node.pretty_print
node.delete(4)
node.pretty_print



print node.inorder
print "\n"
print node.preorder
print "\n"
print node.postorder
print "\n"
print node.inorder { |value| value <= 10}
print "\n"
print node.preorder { |value| value <= 10}
print "\n"
print node.postorder { |value| value <= 10}






