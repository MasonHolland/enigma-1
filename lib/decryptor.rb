require './lib/enigma'

args = *ARGV
enigma = Enigma.new
message = enigma.read_message(ARGV[0])
key = ARGV[2]
date = ARGV[3]
decrypted_message = enigma.decrypt(message, key, date)
enigma.write_message(decrypted_message, ARGV[1])
puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{date}"
