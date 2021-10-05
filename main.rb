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
    @idx_move

  end

  def append(given_value)    
    @size+=1
    new_node = Node.new(given_value)
    if @head == nil
      @head = new_node
      @tail = new_node
      @temp = new_node
    else
      @temp.next_node = new_node
      @tail = new_node
      @temp = new_node
    end
  end

  def my_prepend(given_value)    
    @size+=1
    new_node = Node.new(given_value)
    if @head == nil
      @head = new_node
      @tail = new_node
      @temp = new_node
    else
      new_node.next_node = @head
      @head = new_node
      @temp = new_node
    end
  end

  def at(idx)
    return nil if @size == 0
    return "node does not exist at index #{idx}, list is of size #{@size}" if idx > (size - 1)
    @idx_move = @head
    idx.times do
      @idx_move = @idx_move.next_node
    end
    @idx_move.value
  end

  def pop
    return "list is empty, nothing to pop" if @size == 0
    @idx_move = @head
    (@size-2).times do
      @idx_move = @idx_move.next_node
    end
    @tail = @idx_move
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value)
    return "list is empty, nothing to search" if @size == 0
    return true if @head.value == value
    @idx_move = @head
    (@size-1).times do
      @idx_move = @idx_move.next_node
      return true if @idx_move.value == value
    end
    false
  end

  def find(value)
    return "list is empty, nothing to search" if @size == 0
    return 0 if @head.value == value
    idx = 0
    @idx_move = @head
    (@size-1).times do
      idx += 1
      @idx_move = @idx_move.next_node
      return idx if @idx_move.value == value
    end
    nil
  end

  def my_to_s
    return nil if @size == 0
    print_string = ""
    @idx_move = @head
    (@size).times do
      print_string += "#{@idx_move.value} -> "
      @idx_move = @idx_move.next_node
    end
    print_string
  end

end

a = LinkedList.new

a.append(5)

a.append(6)

a.append(7)

a.my_prepend(4)

puts a.my_to_s