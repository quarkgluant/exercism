class SimpleLinkedList
  attr_accessor :head

  def initialize(array = [])
    array = array.to_a if array.is_a? Range
    self.head = Element.new(array.shift) unless array.empty?
    construct_from_array(array, head)
  end

  def push(element)
    if head.nil?
      self.head = element
    else
      node = head
      while node.next
        node = node.next
      end
      node.next = element
    end
    self
  end

  def pop
    if head.nil?
      nil
    else
      node = head
      previous = nil
      while node.next
        previous = node
        node = node.next
      end
      previous&.next = nil
      node
    end
  end

  def to_a
    array = []
    node = head
    while node
      array.unshift node.datum
      node = node.next
    end
    array
  end

  def reverse!
    current = head
    old_previous = nil
    while current
      next_node = current.next
      current.next = old_previous
      old_previous = current
      current = next_node
    end
    self.head = old_previous
    self
  end

  private

  def construct_from_array(array, node)
    until array.empty?
      new_node = Element.new(array.shift)
      node.next = new_node
      node = new_node
    end
  end
end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(data)
    @datum = data
    @next = nil
  end

  def to_s
    "#{datum}->#{@next&.datum}"
  end
end