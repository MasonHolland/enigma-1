require './lib/enigma'

args = *ARGV
enigma = Enigma.new
message = enigma.read_message(ARGV[0])
date = ARGV[2]

crack = enigma.crack(message, date)

enigma.write_message(crack.message, ARGV[1])

puts "Created '#{ARGV[1]}' with the cracked key #{crack.key} and date #{date}"
