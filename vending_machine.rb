# 自動販売機の処理
class VendingMachine
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  #初期値
  def initialize
    @slot_money = 0
    @sales_money = 0
    @drink_box = []
    @drink_box << {:name => "コーラ", :price => 120, :stock => 5}
    @drink_box << {:name => "レッドブル", :price => 200, :stock => 5}
    @drink_box << {:name => "水", :price => 100, :stock => 5}
  end
  # 硬貨投入処理
  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    @slot_money
  end
  # 払い戻し処理
  def return_money
    @slot_money = 0
  end
  #売上金の取得
  def current_sales_money
    @sales_money
  end
  #自動販売機のリスト
  def drink_list
    @drink_box.each_with_index do |value, index|
      status = "購入可能"
      status = "金額不足" if value[:price] >= @slot_money
      status = "売切" if value[:stock] < 1
      @drink_box[index][:status] = status
    end
  end
  # 購入処理
  def buy(drink_number)
    if @drink_box[drink_number][:stock] >= 1 && @drink_box[drink_number][:price] <= @slot_money
      @drink_box[drink_number][:stock] = @drink_box[drink_number][:stock] - 1
      @sales_money += @drink_box[drink_number][:price]
      @slot_money -= @drink_box[drink_number][:price]
    end
  end
  # 既存のドリンクの在庫補充
  def restock(drink_number, add_stock)
    @drink_box[drink_number][:stock] = @drink_box[drink_number][:stock] + add_stock
  end
  # 新規のドリンクの在庫補充
  def new_stock(add_name, add_price, add_stock)
    @drink_box << {:name => add_name, :price => add_price, :stock => add_stock}
  end
end
