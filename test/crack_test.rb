require './test/test_helper.rb'

class CrackTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = "Hello World! ..end.."
    @date = '270317'
    @encrypted = @enigma.encrypt(@message, 10001, @date)
  end

  def test_that_it_is_crack
    crack = Crack.new(@encrypted, @date, '..end..')
    assert_instance_of Crack, crack
  end

  def test_that_it_finds_correct_key
    crack = Crack.new(@encrypted, @date, '..end..')
    assert_equal crack.key, 10001
  end

  def test_that_it_finds_key_word
    crack = Crack.new(@encrypted, @date, '..end..').message
    assert crack.include?('..end..')
  end

  def test_that_it_does_not_loop_forever
    refute Crack.new("Hello", @date, '..end..').message
  end

end
