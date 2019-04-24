class Array
  def accumulate(&block)
    result = []
    self.each do |item|
      result << block.call(item)
    end
    result
  end
end
