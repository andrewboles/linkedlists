class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :size, :head, :tail
  def initialize
    @size = 0
    @head = nil
    @tail = nil
    @temp

  end
  def append(given_value)    
    @size+=1
    new_node = Node.new(given_value)
    if @head == nil
      @head = new_node
      @temp = new_node
    else
      @temp.next_node = new_node
      @tail = new_node
      @temp = new_node

    end
  end
end

a = LinkedList.new

a.append(5)

a.append(7)

a.append(6)

puts a.tail.value