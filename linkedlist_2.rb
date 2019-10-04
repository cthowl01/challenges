# Linked List Challenge 2
# Author: Chris Howle

class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end

end # end Class


def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
end

def reverse_list(list, previous=nil)
    if list.next_node == nil
        list.next_node = previous
        return list
    end

    original_next = list.next_node
    if previous == nil
        list.next_node = nil
    else
        list.next_node = previous
    end

    reverse_list(original_next, list)
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

