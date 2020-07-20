class PurchaseController < ApplicationController
  before_action :set_item, only: [:show, :pay]
  before_action :correct_user, only: [:show]
  before_action :secret_key, only: [:show, :pay]
  before_action :set_card, only: [:show, :pay]
  before_action :buyer_user, only: [:show]

  require "payjp"

  # 購入画面表示
  def show
    if @card.present?                                                       # テーブルからpayjpの顧客IDを検索
      customer = Payjp::Customer.retrieve(@card.customer_id)                # 保管した顧客IDでpayjpから情報取得
      @default_card_information = customer.cards.retrieve(@card.card_id)    # 保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    end
  end

  # 購入メソッド
  def pay
    if @card.blank?
      flash[:no_card] = "カードを登録してください"
      redirect_to new_user_credit_card_path(current_user.id)       # render "show" セカンドオプション
    else
      Payjp::Charge.create(
        :amount => @item.price,                      # 支払金額を入力
        :customer => @card.customer_id,              # 顧客ID
        :currency => 'jpy',                          # 日本円
      )
      @item.update(buyer_id: current_user.id, deal_close_date: Time.current)
      redirect_to done_item_purchase_index_path                          # 購入完了後、doneページに遷移
    end
  end

  private

  # 商品情報を取得
  def set_item
    @item = Item.find(params[:id])
  end
  
  # 出品者を購入不可にする 
  def correct_user
    redirect_to root_path if current_user.id == @item.seller_id
  end

  # SOLDOUT商品は購入不可にする
  def buyer_user
    redirect_to root_path if @item.buyer_id.present?
  end

  # PAYJPとの通信キー取得
  def secret_key
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  end

  # クレジットカード情報取得
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first
  end

end
