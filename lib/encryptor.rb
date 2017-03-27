require './lib/enigma'
# require 'pry'
args = *ARGV
enigma = Enigma.new
message = enigma.read_message(ARGV[0])
# binding.pry
key = enigma.rand_key
date = enigma.today
encrypted_message = enigma.encrypt(message, key, date)
# binding.pry
enigma.write_message(encrypted_message, ARGV[1])
puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{date}"
