class SimpleLinkedList
  def initialize(array = [])
    @head = Element.new(array.shift) unless array.empty?
    node = @head
    while !array.empty?
      new_node = Element.new(array.shift)
      node.next = new_node
      node = new_node
    end
  end

  def push(element)
    if @head.nil?
      @head = element
    else
      node = @head
      while node.next
        node = node.next
      end
      node.next = element
    end
    self
  end

  def pop
    if @head.nil?
      nil
    else
      node = @head
      while node.next
        node = node.next
      end
      temp = node
      node = nil
      temp
    end
  end

  def to_a
    array = []
    node = @head
    while node
      array.unshift node.datum
      node = node&.next
    end
    array
  end

  def reverse!
    # array = []
    node = @head
    old_previous = @head
    while node
      # array << node
      old_previous = node
      old_next = node&.next
      old_next&.next = old_previous
      old_previous.next = node
      node = old_next&.next
    end
    @head = old_previous
    self
  end

end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(data)
    @datum = data
    @next = nil
  end

end