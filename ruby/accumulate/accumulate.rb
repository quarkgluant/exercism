class Array
  def accumulate
    each_with_object([]) do |item, result|
      result << (yield item)
    end
  end
end
