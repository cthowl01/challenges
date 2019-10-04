# Linked List Challenge 1
# Author: Chris Howle

class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end

end # end Class


class Stack
    attr_reader :data

    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
        @data = LinkedListNode.new(value, @data)
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        if @data    
            popped = @data.value
            @data = @data.next_node
            return popped
        else    
            return nil
        end
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

def reverse_list(list)
    new_stack = Stack.new

    while list
        new_stack.push(list.value)
        list = list.next_node
    end

    # Now flip the stack onto another stack so the reversed list creation will be in the proper order
    second_stack = Stack.new

    while new_stack.data   
        second_stack.push(new_stack.pop)
    end

    while second_stack.data
        new_list = LinkedListNode.new(second_stack.pop, new_list)
    end

    return new_list
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

