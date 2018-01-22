require 'minitest/autorun'
require './problem'

class ProblemTest < Minitest::Test
  def setup
    @bank = Bank.new
    @yen_500 = Money.new(500, :jpy)
    @yen_100 = Money.new(100, :jpy)
    @dollar_5 = Money.new(5, :usd)
  end

  def test_case_1
    res = @bank.break(@yen_500)
    assert_equal [
     @yen_100, 
     @yen_100, 
     @yen_100, 
     @yen_100, 
     @yen_100, 
    ], res
  end

  def test_case_2
    res = @bank.exchange(@yen_500, :usd)
    assert_equal @dollar_5, res
  end
end
