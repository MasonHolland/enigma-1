require 'pry'

class Cipher

  attr_reader :char_map

  def initialize(key, date)
    @char_map = generate(key, date)
  end

  def generate(key, date)
    master_keys = combined(rotations(key), offsets(date))
    master_keys.map { |m_key| build_cipher(m_key) }
  end

  def build_cipher(m_key)
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a + (' '..'@').to_a
    Hash[alpha.zip(alpha.rotate(m_key))]
  end

  def combined(rotations, offsets)
    rotations.map.with_index do |rotation, i|
      offsets[i] + rotation
    end
  end

  def rotations(key)
    (0..3).collect do |i|
      key.to_s[i, 2].to_i
    end
  end

  def offsets(date)
    (date.to_i**2).to_s.split("")[-4..-1].map(&:to_i)
  end

end
