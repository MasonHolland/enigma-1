require './lib/helper'
require 'pry'
class Crack

  attr_reader :key, :message

  def initialize(message, date, key_word = '..end..')
    @key = 10000
    @message = smash(message, date, key_word)
  end

  def smash(message, date, key_word)
    until @key > 99999
      enigma = Enigma.new
      cracked = enigma.decrypt(message, @key, date)
      return cracked if cracked.include?(key_word)
      @key += 1
    end
    false
  end

end
