class BinarySearch
  attr_reader :list

  def initialize(numbers_list)
    raise ArgumentError unless data_sorted?(numbers_list)

    @list = numbers_list
  end

  def middle
    list.length / 2
  end

  def search_for(target)
    return middle if median_value == target

    if target > median_value
      sublist = list[middle..-1]
      raise RuntimeError, 'Not Found' if sublist == list
      BinarySearch.new(sublist).search_for(target) + middle #list[0..middle].length
    else
      sublist = list[0..middle]
      raise RuntimeError, 'Not Found' if sublist == list
      BinarySearch.new(sublist).search_for(target)
    end
  end

  private

  def data_sorted?(numbers_list)
    numbers_list.sort == numbers_list
  end

  def median_value
    list[middle]
  end
end