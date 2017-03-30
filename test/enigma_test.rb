require './test/test_helper.rb'

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

  def test_that_it_loads_file
    file = './test/test_message.txt'
    assert_equal @enigma.read_message(file), "Hello World! ..end.."
  end

  def test_that_it_writes_file
    @enigma.write_message('This is a Test!', 'write_test.txt')
    assert File.exist?('write_test.txt')
    file = @enigma.read_message('write_test.txt')
    assert_equal file, 'This is a Test!'
    File.delete('write_test.txt')
  end

end
