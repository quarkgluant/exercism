class FlattenArray
  def self.flatten(array)
    return if array.size == 1
    array.map(&:itself)
  end
end
