class Cypher

  attr_reader

  def initialize
  end

  def gen_rotation(num)
    rotation = []
    num = array_of(num)
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

  def array_of(num)
    num.to_s.split("")
  end

  def gen_offset(offset = today)
    (offset*offset).to_s.split("")[-4..-1].map { |char| char.to_i }
  end

  def today
    Time.now.strftime("%d%m%y").to_i
  end

end
