class Array
  def keep(&block)
    map { |element| element if block.call(element) }.compact
  end

  def discard(&block)
    difference(keep(&block))
  end
end
