class Decrypt
  attr_reader :message

    def initialize(message, cipher)
      @message = unlock(message, cipher)
    end

    def unlock(message, cipher)
      cipher.flip
      unlocked_message = ""
      i = 0
      message.each_char do |char|
      unlocked_message << cipher.char_map[i][char]
      i += 1
      i = 0 if i > 3
      end
      unlocked_message
    end




  end
