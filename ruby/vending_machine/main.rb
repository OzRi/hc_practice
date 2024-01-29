# frozen_string_literal: true

require_relative 'suica'
require_relative 'vending'

suica = Suica.new
vending = Vending.new

# Suicaには100円以上の任意の金額をチャージできる
puts suica.charge_money(100)

# 100円未満をチャージしようとした場合は例外を発生させる
puts suica.charge_money(99)

# Suicaは現在のチャージ残高を取得できる
puts suica.suica_balance

# 自動販売機は在庫を取得できる
puts vending.display_juice_list

# 購入操作:ペプシを購入できる
vending.purchase('ペプシ', suica)

# チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生
# 残高不足
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)

# 在庫不足
suica.charge_money(1000)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)
vending.purchase('ペプシ', suica)

# 自動販売機は現在の売上金額を取得できる
p vending.sales_amount

# 自動販売機は購入可能なドリンクのリストを取得できる
suica.charge_money(1000)
vending.purchase('いろはす', suica)
vending.purchase('いろはす', suica)
vending.purchase('いろはす', suica)
vending.purchase('いろはす', suica)
vending.purchase('いろはす', suica)
p vending.can_purchase_list

# 自動販売機に在庫を補充できる
vending.restock('いろはす', 4)
puts vending.display_juice_list

# 購入操作:モンスターといろはすを購入できる
vending.purchase('モンスター', suica)
vending.purchase('いろはす', suica)
puts vending.display_juice_list

# 残高,売上金額は外部から書き換えられない
suica.suica_balance = 100
vending.sales_amount = 100
