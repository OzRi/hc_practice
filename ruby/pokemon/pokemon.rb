# frozen_string_literal: true

# pokemonクラス
class Pokemon
  attr_reader :name

  def initialize(name, type1, type2, hit_point)
    @name = name
    @type1 = type1
    @type2 = type2
    @hit_point = hit_point
  end

  def attack
    puts "#{@name}のこうげき！"
  end

  def change_name(new_name)
    if new_name == 'poop'
      puts '不適切な名前です'
    else
      @name = new_name
    end
  end
end
