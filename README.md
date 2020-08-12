# vending_machine

vm.slot_money(貨幣)：投入可能な貨幣を判定し、投入金額に加算

vm.current_slot_money：投入金額の総計を取得

vm.return_money：投入金額の総計を返却

vm.current_sales_money：自動販売機の売上金を取得

vm.drink_list：購入可能なドリンクの一覧を取得

vm.buy(配列番号)：ドリンクの購入処理

vm.restock(配列番号,追加する在庫数)：既存のドリンクの在庫を加算

vm.new_stock(ドリンク名,値段,在庫数)：新しいドリンクの種類を追加
