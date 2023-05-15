class Node
    attr_accessor :next_node, :value
    def initialize(value,next_node)
        @value = value
        @next_node = next_node
    end

    def value
        return @value
    end
end

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(value)
        if @head == nil
            @head = Node.new(value, nil)
        else
            new_node = Node.new(value, @head)
            @head = new_node
        end
    end

    def append(value)
        if @head == nil
            @head = Node.new(value, nil)
        else
            current = @head
            new_node = Node.new(value, nil)
            while current.next_node != nil
                current = current.next_node
            end 
            current.next_node = new_node
        end
    end

    def size
        size = 0
        current = @head
        while current != nil
            size += 1
            current = current.next_node
        end
        return size
    end

    def head
        return @head.value
    end

    def tail
        current = @head
        while current.next_node != nil
            current = current.next_node
        end
        if current.next_node == nil
            return current.value
        end
    end

    def at(index)
        current = @head
        current_index = 0
        while current_index != index
            current_index += 1
            current = current.next_node
        end
        if current_index == index
            return current.value
        end
    end

    def pop 
        current = @head
        while current.next_node.next_node != nil
            current = current.next_node
        end
        last = current.next_node
        current.next_node = nil
        return last.value
    end
    
    def contains?(value)
        current = @head
        while current != nil
            if current.value == value
                return true
            end
            current = current.next_node
        end
        return false
    end

    def find(value)
        current = @head
        current_index = 0
        while current != nil
            if current.value == value
                return current_index
            end
            current = current.next_node
            current_index += 1
        end
        if current == nil
            return nil
        end
    end

    def to_s
        current = @head
        nodes = Array.new
        while current != nil
            nodes.push(current)
            current = current.next_node
        end
        node_string = ""
        nodes.each {|node|
            node_string = node_string + "( #{node.value} ) -> "
        }
        node_string = node_string + "nil"
        print node_string
    end
end

test_list = LinkedList.new
test_list.prepend(4)
test_list.append(5)
test_list.append(6)
test_list.to_s
print "\n"
p test_list.pop
print "\n"
test_list.to_s
print "\n"
p test_list.tail