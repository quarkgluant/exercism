class Deque
  attr_accessor :head, :queue
  PUSH_UNSHIFT = [
          {
              method_name: 'push',
              first: 'head',
              last: 'queue',
              link_before: 'previous',
              link_after: 'next'
          },
          {
              method_name: 'unshift',
              first: 'queue',
              last: 'head',
              link_before: 'next',
              link_after: 'previous'
          }
  ]
  POP_SHIFT = [
      {
          method_name: 'pop',
          first: 'head',
          last: 'queue',
          link_before: 'previous',
          link_after: 'next'
      },
      {
          method_name: 'shift',
          first: 'queue',
          last: 'head',
          link_before: 'next',
          link_after: 'previous'
      }
  ]

  def initialize
    @head = nil
    @queue = nil
  end

  PUSH_UNSHIFT.each do |hash|
    eval <<-END
    def #{hash[:method_name]}(data)
      node = Node.new data
      if #{hash[:first]}.nil?
        self.head = node
        self.queue = node
      else
        previous_#{hash[:last]} = #{hash[:last]}
        previous_#{hash[:last]}.#{hash[:link_after]} = node
        self.#{hash[:last]} = node
        node.#{hash[:link_before]} = previous_#{hash[:last]}
      end
      self
    end
    END
    end

  POP_SHIFT.each do |hash|
  eval <<-END
  def #{hash[:method_name]}
    result = #{hash[:last]}
    if head != queue
      self.#{hash[:last]} = #{hash[:last]}.#{hash[:link_before]}
      self.#{hash[:last]}.#{hash[:link_after]} = nil
    else
      self.head = self.queue = nil
    end
    result.data
  end
  END
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
