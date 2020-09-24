# ドリンクの料金を定義
class DrinkPrice
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new(:cola,120)
  end

  def self.redbull
    self.new(:redbull,200)
  end

  def self.water
    self.new(:water,100)
  end
end

# 自動販売機の処理
class VendingMachine
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  attr_reader :total, :sales_money, :drinklist

  #初期値
  def initialize
    @total = 0
    @sales_money = 0
    @drinklist = {}
    5.times { stock(DrinkPrice.cola) }
  end

  # 硬貨投入処理
  def slot_money(money)
    return money unless MONEY.include?(money)
    @total += money
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    @total
  end

  # 払い戻し処理
  def return_money
    temp_slot_money = @total
    @total = 0
    temp_slot_money
  end

  #売上金の取得
  def current_sales_money
    @sales_money
  end

  # 購入処理
  def putout(drink_name)
    if purchasable?(drink_name)
      @drinklist[drink_name][:stock] = @drinklist[drink_name][:stock] - 1
      @sales_money += @drinklist[drink_name][:price]
      @total -= @drinklist[drink_name][:price]
      [drink_name, @total]
    end
  end

  #購入可能なドリンクリスト表示
  def purchasable_drink_names
    @purchasable_drink = []
    @drinklist.each do |drinks, value|
      if  value[:price] <= @total &&  value[:stock] >= 1
        @purchasable_drink << drinks
      end
    end
    @purchasable_drink
  end

  #購入可能か判定
  def purchasable?(drink_name)
    purchasable_drink_names.include? drink_name
  end

  # ドリンクの在庫補充
  def stock(drink)
    @drinklist[drink.name] = { price: drink.price, stock: 0 } unless @drinklist.has_key? drink.name
    @drinklist[drink.name][:stock] += 1
  end

end
