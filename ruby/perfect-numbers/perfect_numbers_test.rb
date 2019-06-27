require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumbers.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumbers.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumbers.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumbers.classify(12)
  end
end
