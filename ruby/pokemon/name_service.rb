# frozen_string_literal: true

# Nameserviceモジュール,名前の変更
module NameService
  attr_reader :name

  def change_name(new_name)
    if new_name == 'poop'
      puts '不適切な名前です'
    else
      @name = new_name
    end
  end
end
