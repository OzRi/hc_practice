# frozen_string_literal: true

require_relative 'name_service'

# Playerクラス
class Player
  include NameService

  def initialize(name)
    @name = name
  end
end
