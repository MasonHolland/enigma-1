require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma'
require './lib/cypher'

class EnigmaTest < Minitest::Test

  attr_reader

  def setup
    @enigma = Enigma.new
  end

  def test_that_it_is_an_enigma
    assert_instance_of Enigma, @enigma
  end

end