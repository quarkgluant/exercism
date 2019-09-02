class Queens
  attr_reader :w_abscissa, :w_ordinate, :b_abscissa, :b_ordinate

  def initialize(white: , black: nil)
    @w_abscissa = white.first
    @w_ordinate = white.last
    raise ArgumentError unless check_validity?(w_abscissa, w_ordinate)

    unless black.nil?
      @b_abscissa = black.first
      @b_ordinate = black.last
    end
  end

  def check_validity?(abscissa, ordinate)
    (0..7).cover?(abscissa) && (0..7).cover?(ordinate)
  end

  def attack?
    horizontally? || vertically? || diagonally?
  end

  def horizontally?
    w_ordinate == b_ordinate
  end

  def vertically?
    w_abscissa == b_abscissa
  end

  def diagonally?
    (b_abscissa - w_abscissa).abs == (b_ordinate - w_ordinate).abs ? true : false
  end
end
