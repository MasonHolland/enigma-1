require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma'
require './lib/cipher'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def setup
    @message = "Hello World!"
    @cipher = Cipher.new(12345, "071993")
  end

  def test_that_it_is_an_encrypt
    encrypt = Encrypt.new(@message, @cipher)
    assert_instance_of Encrypt, encrypt
  end

  def test_that_it_encrypts
    new_encryption = Encrypt.new(@message, @cipher)
    assert_equal "VBX-C7b0FIPw", new_encryption.message
  end

end
