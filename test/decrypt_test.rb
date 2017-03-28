require './test/test_helper.rb'

class DecryptTest < Minitest::Test

  def setup
    @message = "V!7G\"7\"J%(/W"
    @cipher = Cipher.new(12345, "071993")
  end

  def test_that_is_a_decrypt
    decrypt = Decrypt.new(@message, @cipher)
    assert_instance_of Decrypt, decrypt
  end

  def test_that_it_decrypts
    new_decryption = Decrypt.new(@message, @cipher)
    assert_equal "Hello World!", new_decryption.message
  end

end
