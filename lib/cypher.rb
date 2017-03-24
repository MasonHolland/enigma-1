class Cypher

  attr_reader

  def initialize
  end

  def generate(key)
    gamma = ('a'..'z').to_a + ('A'..'Z').to_a
    Hash[gamma.zip(gamma.rotate(gen_key(key)[0]))]
  end

  def gen_key(num)
    key = []
    gen_rotation(num).each_with_index do |num, i|
      key << gen_offset[i] + num
    end
  end

  def gen_rand_key
    key = []
    5.times { key << rand(0..9) }
    key
  end

  def gen_rotation(num = gen_rand_key)
    rotation = []
    key = string_array_from_num(num)
    if key.length == 5
      i = 0
      until i == key.length-1 do
        rotation << key[i]+key[i+1]
        i+=1
      end
      rotation.map { |char| char.to_i }
    else
      false
    end
  end

  def gen_offset(offset = today)
    num_array_from_string((offset*offset).to_s[-4..-1])
  end  

  def today
    Time.now.strftime("%d%m%y").to_i
  end

  def string_array_from_num(num)
    num.to_s.split("")
  end

  def num_array_from_string(string)
    string.split("").map { |char| char.to_i }
  end

end
