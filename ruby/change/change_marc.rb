class Change
  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end

  def initialize
    @nombre_pieces = 0
    @pieces = []
  end

  def generate(coins, target)
    target = [target].flatten
    raise ImpossibleCombinationError if coins.empty? || (target.max < coins.min)
    p "target before: #{target}"
    if target.min > 0
      target = target.map do |coin_target|
        p "coin_target before: #{coin_target}"
        coins.map do |coin|
          p "coin: #{coin}"
          @pieces
          coin_target - coin >= 0 ? coin_target - coin : -1
        end
      end.flatten.sort.delete_if(&:negative?).uniq
      @pieces += target
      @nombre_pieces += 1
      p "target: #{target}"
      generate(coins, target)
    end
    @nombre_pieces
  end


  def self.generate(coins, target)
    self.new.generate(coins, target)
  end
end

puts Change.generate([1, 5, 10, 21, 25], 63)