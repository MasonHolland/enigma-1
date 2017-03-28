require './test/test_helper.rb'

class CipherTest < Minitest::Test

  def setup
     @cipher = Cipher.new(12345, '013081')
  end

  def test_that_it_is_a_cypher
    assert_instance_of Cipher, @cipher
  end

  def test_rotations_pairs_five_digit_int_to_array_of_four_ints
    assert_equal @cipher.rotations(12345), [12, 23, 34, 45]
  end

  def test_offsets_is_last_four_digits_of_date_squared
    assert_equal @cipher.offsets('013081'), [2, 5, 6, 1]
  end

  def test_combined_sums_each_element_of_offsets_and_rotations_together
    rotations = @cipher.rotations(12345)
    offsets = @cipher.offsets('013081')
    assert_equal @cipher.combined(rotations, offsets), [14, 28, 40, 46]
  end

  def test_build_cipher_matches_value_to_key_based_on_offset
    assert_equal @cipher.build_cipher(1)['A'], 'B'
    assert_equal @cipher.build_cipher(2)['a'], 'c'
    assert_equal @cipher.build_cipher(3)['K'], 'N'
    assert_equal @cipher.build_cipher(4)['p'], 't'
  end

  def test_that_it_flips_the_cipher
    cipher = Cipher.new(12345, "071993")
    cipher.flip
    assert_equal cipher.char_map[0]['V'], 'H'
  end

  def test_generate_returns_array_of_four_ciphers
    assert_equal @cipher.generate(12345, '013081').length, 4
    assert_instance_of  Hash, @cipher.generate(12345, '013081')[0]
    assert_instance_of  Hash, @cipher.generate(12345, '013081')[1]
    assert_instance_of  Hash, @cipher.generate(12345, '013081')[2]
    assert_instance_of  Hash, @cipher.generate(12345, '013081')[3]
  end

end
