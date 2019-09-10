class Deque
  attr_accessor :head, :queue

  def initialize
    @head = nil
    @queue = nil
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

  def shift
    result = head
    if head != queue
      self.head = head.next
      self.head.previous = nil
    else
      self.head = nil
      self.queue = nil
    end
    result.data
  end

  def push(data)
    insert(data, head, queue, 'next=' , 'previous=', 'queue')
    self
  end
  
  def unshift(data)
    insert(data, queue, head, 'previous=' , 'next=', 'head')
    self
  end

  def insert(data, first_one, last_one, before, after, str_fence)
    node = Node.new data
    if first_one.nil?
      self.head = node
      self.queue = node
    else
      backup = last_one
      backup.send(before, node)
      eval "self.#{str_fence} = node"
      node.send(after, backup)
    end
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
    "#{previous&.data}->|#{data}|->#{@next&.data}"
  end
end

