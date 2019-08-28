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

  def clean_up
    # self.send :initialize, list
    @lower_bound = 0
    @upper_bound = list.length - 1
  end

  def search_for(target)
    p "middle: #{middle}"
    p "median_value: #{median_value}"
    p "list: #{list}"
    p "list[#{middle}] = #{median_value}"
    if median_value == target
      result = middle
      clean_up
      return result
    end
    if upper_bound <= lower_bound
      clean_up
      raise RuntimeError, 'Not Found'
    end

    if target > median_value
      self.lower_bound += 1
      search_for(target)
    else
      self.upper_bound -= 1
      search_for(target)
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
