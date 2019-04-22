class BinarySearch
  attr_reader :list

  def initialize(numbers_list)
    raise ArgumentError unless numbers_list.sort == numbers_list

    @list = numbers_list
  end

  def middle
    list.length / 2
  end

  def search_for(target)
    raise RuntimeError unless list.include? target

    if list[middle] == target
      middle
    elsif target > list[middle]
      BinarySearch.new(list[(middle + 1)..-1]).search_for(target) + list[0..middle].length
    else
      BinarySearch.new(list[0...middle]).search_for(target)
    end
  end
end