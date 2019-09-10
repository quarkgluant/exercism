class Deque
  attr_accessor :head, :queue

  def initialize
    @head = nil
    @queue = nil
  end

  def push(data)
    node = Node.new data
    if head.nil?
      self.head = node
      self.queue = node
    else
      previous_end = queue
      previous_end.next = node
      self.queue = node
      node.previous = previous_end
    end
    self
  end

  def pop
    result = queue
    if head != queue
      self.queue = queue.previous
      self.queue.next = nil
    else
      self.head = self.queue = nil
    end
    result.data
  end

  def unshift(data)
    node = Node.new data
    if queue.nil?
      self.head = node
      self.queue = node
    else
      previous_head = head
      previous_head.previous = node
      self.head = node
      node.next = previous_head
    end
    self
  end


  def shift
    result = head
    if head != queue
      self.head = head.next
      self.head.previous = nil
    else
      self.head = self.queue = nil
    end
    result.data
  end
end


class Node
  attr_reader :data
  attr_accessor :next, :previous

  def initialize(data)
    @data = data
    @next = nil
    @previous = nil
  end

  def to_s
    "#{previous&.data}->#{data}->#{@next&.data}"
  end
end
