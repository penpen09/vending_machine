# class Drink
  #ドリンクの種類があるだけハッシュに入れる
#   def default
#     drinkbox = [
#       {:name => "コーラ", :price => 120, :stock => 5},
#       {:name => "レッドブル", :price => 200, :stock => 5},
#       {:name => "水", :price => 100, :stock => 5}
#     ]
#   end
# end

class VendingMachine
  def restock
    @drinkbox = {name: "コーラ", price: 120, stock: 5}
    input_stock = gets.to_i

    # 在庫数追加
    # @drink.default[input_drink-1][:stock] = @drink.default[input_drink-1][:stock] - input_stock
    # after_input_stock = default[input_drink-1][:stock] + input_stock
    # h = default[input_drink-1][:stock]
    # puts after_input_stock
    # puts h

    @drinkbox[:stock] = @drinkbox[:stock] + input_stock
    puts @drinkbox[:stock]


    #現在の在庫数を表示
    # puts "#{default[input_drink-1][:name]}の在庫数： #{default[input_drink-1][:stock]}本"
    puts "#{@drinkbox[:name]}の在庫数： #{@drinkbox[:stock]}本"
  end

  def drink_list
    puts @drinkbox[:name]
    puts @drinkbox[:price]
    puts @drinkbox[:stock]
  end

end
