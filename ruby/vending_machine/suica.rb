# frozen_string_literal: true

# Suicaクラス
class Suica
  attr_reader :suica_balance

  def initialize
    @suica_balance = 500
  end

  def charge_money(money)
    raise '100円未満はチャージできない' unless money >= 100

    @suica_balance += money
  end

  def withdraw_money(money)
    @suica_balance -= money
  end

  private

  attr_writer :suica_balance
end
