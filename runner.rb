require_relative "lib/cipher"
require_relative "lib/enigma"

e = Enigma.new

e.encrypt("Hello").each { |cipher| puts cipher }
