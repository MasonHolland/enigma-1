require './lib/helper'

class Enigma

  attr_reader :cipher

  def encrypt(message, key = rand_key, date = today)
    cipher = Cipher.new(key, date)
    Encrypt.new(message, cipher).message
  end

  def decrypt(message, key = rand_key, date = today)
    cipher = Cipher.new(key, date)
    Decrypt.new(message, cipher).message
  end

  def crack(message, date = today)
    Crack.new(message, date)
  end

  def today
    Time.now.strftime("%d%m%y").to_i
  end

  def rand_key
    key = rand(1..9).to_s
    4.times { key << rand(0..9).to_s }
    key.to_i
  end

  def read_message(read_name)
    (File.open(read_name, 'r') { |f| f.read}).chomp
  end

  def write_message(message, write_name)
    File.open(write_name, 'w') {|f| f.write(message)}
  end

end
