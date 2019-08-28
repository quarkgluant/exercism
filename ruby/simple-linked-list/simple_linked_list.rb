class SimpleLinkedList
  def initialize(array = [])
    array = array.to_a if array.is_a? Range
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
  #
  # def pop_bis
  #   if @head.nil?
  #     nil
  #   else
  #     previous = @head
  #     next_node = previous.next
  #     while next_node
  #       previous = next_node
  #       next_node = next_node.next
  #     end
  #     previous&.next = nil
  #     next_node
  #   end
  # end

  def pop
    if @head.nil?
      nil
    else
      node = @head
      previous = nil
      while node.next
        # p "node début while: #{node}"
        previous = node
        # p "previous: #{previous}"
        node = node.next
        # p "node fin while: #{node}"
      end
      # p "node APRES while: #{node}"
      # p "previous: #{previous}"
      previous&.next = nil
      # p "NOUVELLE BOUCLE"
      node
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
    current = @head
    old_previous = nil
    while current
      next_node = current&.next
      # p "old_previous avant: #{old_previous}"
      current.next = old_previous
      # p "currrent.next après current.next = old_previous: #{current&.next}"
      old_previous = current
      # p "old_previous après: #{old_previous}"
      current = next_node
      # p "currrent en fin de boucle: #{current}"
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

  def to_s
    "#{datum}->#{@next&.datum}"
  end
end