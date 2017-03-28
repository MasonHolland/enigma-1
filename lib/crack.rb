require './lib/helper'

class Crack

  attr_reader :key

  def initialize
    @key = 10000
  end

  def break(message, date, key_word)
    until @key > 99999
      enigma = Enigma.new
      cracked = enigma.decrypt(message, @key, date)
      return cracked if cracked.include?(key_word)
      @key += 1
    end
    false
  end

end
