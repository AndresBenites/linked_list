class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail

  def initialize()
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      node = @head
      until node.next_node.nil?
        node = node.next_node
      end
      return node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size(size = 0)
    return size if @head.nil?
    node = @head
    size += 1
    until node.next_node.nil?
      node = node.next_node
      size += 1
    end
    return size
  end

  def head()
    return nil if @head.nil?
    return @head.value
  end

  def tail()
    return nil if @head.nil?
    node = @head
    until node.next_node.nil?
      node = node.next_node
    end
    return node.value
  end

  def at(index)
    return nil if index > self.size - 1 || index <= 0
    node = @head
    i = 0
    until i == index
      node = node.next_node
      i += 1
    end
    return node.value
  end

  def pop()
    return nil if @head.nil?
    node = @head
    self.size - 2.times do
      node = node.next_node
    end
    node.next_node = nil
  end

  def contains?(value)
    value = value.downcase
    return nil if @head == nil
    node = @head
    check = [node.value.downcase]
    until node.next_node.nil?
      node = node.next_node
      check << node.value.downcase
    end
    return check.include?(value)
  end

  def find(value)
    value = value.downcase
    return nil if @head == nil
    node = @head
    check = [node.value.downcase]
    until node.next_node.nil?
      node = node.next_node
      check << node.value.downcase
    end
    return check.find_index(value)
  end

  def to_s()
    return nil if @head.nil?
    node = @head
    my_string = "( #{node.value} )"
    until node.next_node.nil?
      node = node.next_node
      my_string += " -> ( #{node.value} )"
    end
    my_string += " -> nil"
    return my_string
  end

  def insert_at(value, index) # extra credit
    return
  end

  def remove_at(index) # extra credit
    return
  end
end

#######################

my_list = LinkedList.new()
my_list.append("fish")
my_list.append("dino")
my_list.prepend("bird")
my_list.append("dog")
p my_list.size
p my_list.head
p my_list.tail
p my_list.at(3)
p my_list.to_s
p my_list.contains?("dog")
my_list.pop()
p my_list.to_s
p my_list.size()
p my_list.contains?("bird")
p my_list.contains?("dog")
p my_list.find("dino")
p my_list.find("cat")
