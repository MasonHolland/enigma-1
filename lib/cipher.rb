require 'pry'

class Cipher

  attr_reader

  def initialize
  end

  def generate(key, date)
    combine(rotations(key), offsets(date)).map { |combo| cipher(combo) }
  end

  def cipher(key)
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a + (' '..'@').to_a
    Hash[alpha.zip(alpha.rotate(key))]
  end

  def combine(rotations, offsets)
    rotations.map.with_index do |rotation, i|
      offsets[i] + rotation
    end
  end

  def rotations(key)
    (0..3).collect.with_index do |i|
      key.to_s[i, 2].to_i
    end
  end

  def offsets(date)
    (date.to_i**2).to_s.split("")[-4..-1].map(&:to_i)
  end

end
