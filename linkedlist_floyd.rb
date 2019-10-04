# Linked List Challenge 2 Bonus - Floyd's Cycle Detection Algorithm
# Author: Chris Howle

class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end

end # end Class

def floyd(list)
  tortoise = list
  hare = list

  while true
    if hare.next_node == nil 
      return "No Loop Found"
    end

    hare = hare.next_node

    if hare.next_node == nil 
      return "No Loop Found"
    end

    hare = hare.next_node
    tortoise = tortoise.next_node

    if hare == tortoise
      return "Loop Found"
    end
  end # end while

end # end method


node8 = LinkedListNode.new(8)
node7 = LinkedListNode.new(7, node8)
node6 = LinkedListNode.new(6, node7)
node5 = LinkedListNode.new(5, node6)
node4 = LinkedListNode.new(4, node5)
node3 = LinkedListNode.new(3, node4)
node2 = LinkedListNode.new(2, node3)
node1 = LinkedListNode.new(1, node2)
node8.next_node = node3

puts floyd(node1)
