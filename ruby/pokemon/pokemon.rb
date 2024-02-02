# frozen_string_literal: true

require_relative 'name_service'

# pokemonクラス
class Pokemon
  include NameService

  attr_reader :type1, :type2
  attr_accessor :name

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
