
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

class MyQueue

  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end


def depth_first(tree, num)

  puts "Searching for " + num.to_s + " using depth first.."

  if tree.payload == num
    return tree
  elsif tree == nil
    return nil
  end

  stack = []

  if tree.children != []
    tree.children.each do |i|
      stack << tree
      retval = depth_first(i, num)
      if retval != nil
        if retval.payload == num
          return retval
        end
      end
    end

    # After children have been processed, pop from stack
    tree=stack.pop
  end
end


def breadth_first(tree, num)

  puts "Searching for " + num.to_s + " using breadth first.."

  if tree.payload == num
    return tree
  elsif tree == nil
    return nil
  end

  aqueue = MyQueue.new

  # Directly initialize head with the value of tree
  head = tree

  while aqueue
    puts "active head is " + head.payload.to_s
    head.children.each do |i|
      if i.payload == num
        return i
      else 
        # Put each child in the queue
        aqueue.enqueue(i)
      end # end if
    end # end do

    # After children have been processed, dequeue a node
    # that will become the new head
    head = aqueue.dequeue
  end # end while
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

x = breadth_first(trunk, 11)
if x.payload != nil
  puts "Found match for " + x.payload.to_s
else
  puts "No match"
end

y = depth_first(trunk, 11)
if y.payload != nil
  puts "Found match for " + y.payload.to_s
else
  puts "No match"
end


