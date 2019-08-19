
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Bst
  # attr_accessor :root, :left, :right
  # attr_accessor :data, :root, :left, :right

  def initialize(data)
    root = Node.new(data)
    @root = root
    # @data = root.data
    # @left = root.left
    # @right = root.right
  end
  #
  # def data
  #   Node.data
  # end

  def insert(new_data)
    @root.insert_at(new_data, node: @root)
  end

  def insert_at(new_data, node: @root)
    # new_node = Node.new new_data
    if new_data > node.data
      if node.right.nil?
        node.right = Node.new(new_data)
        # binding.pry
        return node
      else
        insert_at(new_data, node: node.right)
      end
    elsif new_data == node.data
      return node
    else
      if node.left.nil?
        node.left = Node.new(new_data)
        return node
      else
        insert_at(new_data, node: node.left)
      end
    end
    node
  end

  def insert(new_data)
    insert_at(new_data, @root)
  end
  #
  # private
  #
  # def insert_at(new_data, node)
  #   if new_data > data
  #     if node.right.nil?
  #       right = new_data
  #     else
  #       data = right
  #       insert(new_data, @right)
  #     end
  #   else
  #     if data.left.nil?
  #       data.left = new_data
  #     else
  #       # data = left
  #       insert(new_data, left)
  #     end
  #   end
  # end
end

# four = Bst.new 4
# four.insert 5