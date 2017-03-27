class Enigma

  attr_reader :cipher

  def initialize
  end

  def encrypt(message, key = rand_key, date = today)
    cipher = Cipher.new
    cipher.generate(key, date)
  end

  def today
    Time.now.strftime("%d%m%y").to_i
  end

  def rand_key
    key = rand(1..9).to_s
    4.times { key << rand(0..9).to_s }
    key.to_i
  end

end
