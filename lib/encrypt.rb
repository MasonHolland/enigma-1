require './lib/helper'

class Encrypt
attr_reader :message

  def initialize(message, cipher)
    @message = lock(message, cipher)
  end

  def lock(message, cipher)
    locked_message = ""
    i = 0
    message.chars.map do |char|
      locked_message << cipher.char_map[i][char]
      i < 3 ? i += 1 : i = 0
    end
    locked_message
  end

end
