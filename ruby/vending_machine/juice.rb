# frozen_string_literal: true

# ジュースクラス
class Juice
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
