require_relative "lib/cipher"
require_relative "lib/enigma"

e = Enigma.new

puts e.encrypt("Hello")