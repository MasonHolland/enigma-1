require 'minitest/autorun'
require 'minitest/pride'

require './lib/cypher'

class CypherTest < Minitest::Test

  attr_reader

  def setup
     @cypher = Cypher.new
  end

  # To account for date change

  def offset_test(offset)
    (offset*offset).to_s.split("")[-4..-1].map { |char| char.to_i }
  end

  # Tests

  def test_that_it_is_a_cypher
    assert_instance_of Cypher, @cypher
  end

  def test_that_gen_rotation_only_takes_5_digits
    refute @cypher.gen_rotation(1234)
  end

  def test_that_gen_rotation_makes_rotation
    assert_equal @cypher.gen_rotation(12345), [12,23,34,45]
  end

  def test_that_gen_key_is_five_digits
    key = @cypher.gen_rand_key
    assert_equal key.length, 5
  end

  def test_that_today_returns_today
    assert_equal @cypher.today, Time.now.strftime("%d%m%y").to_i
  end

  def test_that_gen_offset_makes_offset
    assert_equal @cypher.gen_offset(@cypher.today), offset_test(@cypher.today)
  end

end
