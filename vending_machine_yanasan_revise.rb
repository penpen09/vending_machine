class VendingMachine
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  #初期値
  def initialize
    @slot_money = 0
    @sales_money = 0
    # ドリンクにつき、①Drinkクラスのインスタンスの作成をやめ、かつ、②「二重入れ子」に入れる各ハッシュに初期値設定した上で変数に代入
    @cola_box = {:name => "コーラ", :price => 120, :stock => 5}
    @redbull_box = {:name => "レッドブル", :price => 200, :stock => 5}
    @water_box = {:name => "水", :price => 100, :stock => 5}
    # 上記のように、各ハッシュに初期値・変数を設定した上で、二重入れ子にする
    # （その上で、全ての箇所でDrinkクレスのメソッドのところを書き換え）
    @drink_box = []
    @drink_box << @cola_box
    @drink_box << @redbull_box
    @drink_box << @water_box

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
    puts "返却： #{@slot_money}円"
    @slot_money = 0
  end

  #売上金の取得
  def current_sales_money
    puts "売上金： #{@sales_money}円"
  end

  #自動販売機のリスト
  def drink_list
    @drink_box.each_with_index do |value, index|
      puts "：#{index+1}　　　#{value[:name]}：#{value[:price]}円：#{value[:stock]}本"
    end
  end

  # 購入処理
  def buy
    puts "--------------------------------------------"
    puts "購入するドリンクの「番号」を入力してください"
    puts "--------------------------------------------"
    puts "番号：ドリンク ：値段    ：在庫数"

    #自動販売機のリスト表示
    drink_list

    # ユーザからアクションを取得（）
    input_drink = gets.to_i

    # ユーザアクションから投入金額、在庫の点で購入できるか判定
    if @drink_box[input_drink-1][:stock] >= 1 && @drink_box[input_drink-1][:price] <= @slot_money
      #true（ジュースの在庫を減らし、売り上げ金額を増やす。）
      @sales_money += @drink_box[input_drink-1][:price]
      @slot_money -= @drink_box[input_drink-1][:price]
      @drink_box[input_drink-1][:stock] = @drink_box[input_drink-1][:stock] - 1 #在庫を減らす
      puts "購入: #{@drink_box[input_drink-1][:name]}, 残金：#{@slot_money}円"
    end
  end

  # 在庫補充
  def restock

    puts "--------------------------------------------"
    puts "在庫を補充するドリンクの「番号」を入力してください"
    puts "--------------------------------------------"
    puts "番号：ドリンク ：値段    ：在庫数"

    #自動販売機のリスト表示
    drink_list

    # ユーザからアクションを取得（）
    input_drink = gets.to_i

    # 補充する在庫数を入力
    puts "--------------------------------------------"
    puts "「#{@drink_box[input_drink-1][:name]}」を補充する「個数」を入力してください"
    puts "--------------------------------------------"

    # ユーザからアクションを取得（）
    input_stock = gets.to_i

    # 在庫数追加
    @drink_box[input_drink-1][:stock] = @drink_box[input_drink-1][:stock] + input_stock

    #現在の在庫数を表示
    puts "#{@drink_box[input_drink-1][:name]}の在庫数： #{@drink_box[input_drink-1][:stock]}本"

  end
end
