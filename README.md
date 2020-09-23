# vending_machine

初期化

```
require './vending_machine.rb'
vm = VendingMachine.new
```

| コマンド                           | 処理                            |
|:----------------------------------|:-------------------------------|
|vm.slot_money(貨幣)                |投入可能な貨幣を判定し、投入金額に加算 |
|vm.current_slot_money             |投入金額の総計を取得                |
|vm.return_money                   |投入金額の総計を返却                |
|vm.current_sales_money            |自動販売機の売上金を取得             |
|vm.drink_list                     |購入可能なドリンクの一覧を取得        |
|vm.buy(配列番号)                   |ドリンクの購入処理                  |
|vm.restock(配列番号,追加する在庫数)  |既存のドリンクの在庫を加算            |
|vm.new_stock(ドリンク名,値段,在庫数) |新しいドリンクの種類を追加            |


### How to use

````
$ irb
> require './lib/vending_machine'
> machine = VendingMachine.new
> machine.stock_info # => {:cola=>{:price=>120, :stock=>5}}
> machine.store Drink.redbull
> machine.store Drink.water
> machine.stock_info # => {:cola=>{:price=>120, :stock=>5}, :redbull=>{:price=>200, :stock=>1}, :water=>{:price=>100, :stock=>1}}
> machine.insert 1 # => 1 (Not available)
> machine.insert 5 # => 5 (Not available)
> machine.insert 10 # => nil (OK)
> machine.insert 50 # => nil (OK)
> machine.total # => 60
> machine.refund # => 60
> machine.total # => 0
> machine.insert 100
> machine.purchasable_drink_names # => [:water]
> machine.purchasable? :water # => true
> machine.purchasable? :cola # => false
> machine.purchasable? :redbull # => false
> machine.purchase :redbull # => nil (Not purchasable)
> machine.insert 50
> machine.purchasable_drink_names # => [:cola, :water]
> machine.purchasable? :cola # => true
> machine.insert 100
> machine.purchasable_drink_names # => [:cola, :redbull, :water]
> machine.purchasable? :redbull # => true
> machine.total # => 250
> machine.purchase :redbull # => [<Drink: name=redbull, price=200>, 50]
> machine.total # => 0
> machine.refund # => 0
> machine.sale_amount # => 200
> machine.stock_info # => {:cola=>{:price=>120, :stock=>5}, :redbull=>{:price=>200, :stock=>0}, :water=>{:price=>100, :stock=>1}}
> exit
````
