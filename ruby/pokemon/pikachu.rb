# frozen_string_literal: true

# Pikachuクラス
class Pikachu < Pokemon
  def attack
    super
    puts "#{@name}の10万ボルト!"
  end
end
