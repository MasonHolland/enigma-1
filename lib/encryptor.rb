require './lib/enigma'

args = *ARGV
enigma = Enigma.new
message = enigma.read_message(ARGV[0])
key = enigma.rand_key
date = enigma.today
encrypted_message = enigma.encrypt(message, key, date)
enigma.write_message(encrypted_message, ARGV[1])
puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{date}"
