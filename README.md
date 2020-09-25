## 使用方法


```
$ irb
require './vending_machine.rb'
m = VendingMachine.new

(金額投入)
m.slot_money(500) # => 500
m.total # => 500
m.return_money # => 500

(投入できる硬貨ではない場合)
m.slot_money(180) # => 180
m.total # => 0

(購入可能なドリンクリストを表示)
m.purchasable_drink_names # => [:cola]
(投入金額が不足していた場合)
m.purchasable_drink_names # => []

(購入可能かどうかを判定)
m.purchasable?(:cola) # => true

(購入)
m.putout(:cola) # => [:cola, 380]

(補充)
m.stock(DrinkPrice.cola) # => 5
m.stock(DrinkPrice.redbull) # => 1
m.stock(DrinkPrice.water) # => 1

exit

```
