class Array
  def keep
    each_with_object([]) { |element, array| array << element if yield element }
  end

  def discard
    each_with_object([]) { |element, array| array << element unless yield element }
  end
end
