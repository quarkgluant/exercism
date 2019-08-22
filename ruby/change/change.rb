require 'pry'
require 'pry-rails'

class Change
  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end

  attr_accessor :coins, :coins_bis, :result

  def initialize(coins, target)
    @coins_bis = 0
    @coins = coins
    @target = target
    @result = []
  end

  def self.generate_bis(coins, target)
    raise NegativeTargetError if target < 0
    # raise ImpossibleCombinationError if target < coins.min
    @coins_bis = coins
    p "coins dans generate avant appel change: #{coins}"
    p "@coins_bis dans generate avant appel change: #{@coins_bis}"
    result = self.new.change_bis(coins, target)
    p "coins dans generate APRES appel change: #{coins}"
    p "avant le if result: #{result}"
    if result.sum != target
      coins = @coins_bis[0...-1]
      p "coins dans le if result.sum != target: #{coins}"
      result = self.new.change_bis(coins, target)
    else
      result
    end
  end

  def change_bis(coins, target)
    working_coins = coins
    raise ImpossibleCombinationError if coins.nil?
    return [] if working_coins.empty?
    max = working_coins.pop
    return [max] * (target / max) if working_coins.length == 1 && target % working_coins.max == 0
    # binding.pry
    return change_bis(working_coins, target % max) + [max] * (target / max)
  end

  def self.generate(coins, target)
    raise NegativeTargetError if target < 0

    coins.pop if coins.max > target
    target = [target]
    self.new(coins, target).change(coins, target)
  end

  def change(coins, target)
    max = coins.pop
  end
end