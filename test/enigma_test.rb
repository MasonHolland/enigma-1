require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma'
require './lib/cipher'

class EnigmaTest < Minitest::Test

  attr_reader

  def setup
    @enigma = Enigma.new
  end

  def test_that_it_is_an_enigma
    assert_instance_of Enigma, @enigma
  end

  def test_that_today_returns_today
    assert_equal @enigma.today, Time.now.strftime("%d%m%y").to_i
  end

  def test_that_rand_key_makes_five_digit_int
    key = @enigma.rand_key
    assert_equal key.to_s.length, 5
    assert_instance_of Fixnum, key
  end

end
