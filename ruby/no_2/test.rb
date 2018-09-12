
if RUBY_VERSION == '2.3.1'
  p 'このバージョンだとテストファイルの読み込みに失敗するよ'
  exit
end
require 'minitest/autorun'
require './problem'

class ProblemTest < Minitest::Test
  def setup
    @nishisuke = Person.new('nishisuke')
    @dai = Person.new('dai')
    @kenta = Person.new('kenta')
    @nishisuke.friends << @dai
    @nishisuke.friends << @kenta
  end

  def test_case_1
    assert @dai.friend_with?(@nishisuke)
  end

  def test_case_2
    refute @dai.friend_with?(@kenta)
  end
end
