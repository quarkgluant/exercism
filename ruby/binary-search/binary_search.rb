class BinarySearch
  attr_reader :list
  attr_accessor :upper_bound, :lower_bound

  def initialize(numbers_list)
    raise ArgumentError unless data_sorted?(numbers_list)

    @list = numbers_list
    @lower_bound = 0
    @upper_bound = list.length - 1
  end

  def middle
     (lower_bound + upper_bound) / 2
  end

  def search_for(target)
    return clean_up_and_return(middle) if median_value == target
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

  def clean_up_and_return(result)
    self.send :initialize, list
    result
  end

end
