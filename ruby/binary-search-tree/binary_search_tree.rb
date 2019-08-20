class Bst
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    if new_data > data
      right.nil? ? @right = Bst.new(new_data) : right.insert(new_data)
    else
      left.nil? ? @left = Bst.new(new_data) : left.insert(new_data)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
  end
end
