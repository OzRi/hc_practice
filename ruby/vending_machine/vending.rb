# frozen_string_literal: true

require_relative 'suica'
require_relative 'juice'

# 自動販売機クラス
class Vending
  attr_reader :sales_amount

  def initialize
    @juice_types = [
      { name: 'ペプシ', price: 150 },
      { name: 'いろはす', price: 120 },
      { name: 'モンスター', price: 230 }
    ]
    @juice_stocks = initial_stock
    @sales_amount = 0
  end

  # 初期在庫5本ずつ
  def initial_stock
    juice_stocks = []
    @juice_types.each do |juice_type|
      5.times do
        juice_stocks << Juice.new(juice_type[:name], juice_type[:price])
      end
    end
    juice_stocks
  end

  # 商品リスト
  def display_juice_list
    juice_types_name = @juice_types.map { |juice| juice[:name] }
    juice_types_name.map do |juice_name|
      count = @juice_stocks.count { |item| item.name == juice_name }
      "#{juice_name}:#{count}"
    end
  end

  # 購入可能な商品リスト
  def can_purchase_list
    @juice_stocks.group_by(&:name).map { |name, count| "#{name},#{count.length}" }
  end

  # 購入処理
  def purchase(name, suica)
    check_purchase(name, suica)
    purchase_juice = @juice_stocks.find { |item| item.name == name }
    @juice_stocks.delete(purchase_juice)
    @sales_amount += purchase_juice.price
    suica.withdraw_money(purchase_juice.price)
  end

  # 購入可否確認
  def check_purchase(name, suica)
    juice = @juice_types.find { |item| item[:name] == name }
    raise '残高不足' unless suica.suica_balance > juice[:price]
    raise '在庫不足' if @juice_stocks.none? { |item| item.name == name }
  end

  # 在庫補充
  def restock(name, count)
    juice_name = @juice_types.find { |juice| juice[:name] == name }
    count.times do
      @juice_stocks << Juice.new(name, juice_name[:price])
    end
  end

  private

  def sales_amount=(sales_amount)
    @sales_amount += sales_amount
  end
end
