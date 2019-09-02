class BinarySearch
  attr_reader :list
  attr_accessor :upper_bound, :lower_bound

  def initialize(numbers_list)
    raise ArgumentError unless data_sorted?(numbers_list)

    @list = numbers_list
    reset_bounds
  end

  def middle
     (lower_bound + upper_bound) / 2
  end

  def search_for(target)
    return complete_search(middle) if median_value == target
    raise RuntimeError, 'Not Found' if upper_bound <= lower_bound

    if target > median_value
      self.lower_bound += 1
    else
      self.upper_bound -= 1
    end
    search_for(target)
  end

  private

  def data_sorted?(numbers_list)
    numbers_list.sort == numbers_list
  end

  def median_value
    list[middle]
  end

  def complete_search(result)
    reset_bounds
    result
  end

  def reset_bounds
    self.upper_bound = (list.length - 1)
    self.lower_bound = 0
  end
end
