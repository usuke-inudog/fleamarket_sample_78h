class CreditCardsController < ApplicationController

  require "payjp"
  before_action :set_card, only: [:destroy, :show]

  # 登録画面表示
  def new
    card = CreditCard.where(user_id: current_user.id).first
    redirect_to user_path(current_user) if card.present?
  end

  def index
  end

  # クレジットカード登録
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]        # PAYJPとの通信開始
    if params["payjp-token"].blank?                 # "payjp-token" PAYJPとの通信でトークンが入ったparams
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: "登録テスト",
        metadata: {user_id: current_user.id},
        card: params["payjp-token"]                 # "payjp-token" PAYJPとの通信でトークンが入ったparams
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to user_path(current_user)
      else
        redirect_to action: "new"
      end
    end
  end

  # クレジットカード使用 (PAYJPとの通信)
  def show
    @user = User.find(params[:id])
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]                 # PAYJPとの通信開始
      customer = Payjp::Customer.retrieve(@card.customer_id)   # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      @customer_card = customer.cards.retrieve(@card.card_id)  # カスタマー情報からカードの情報を引き出す
    end
  end

  # クレジットカード削除
  def destroy
    if @card.delete
      redirect_to user_path(current_user)
    else
      redirect_to action: "new"
    end
  end

  # ログインユーザーのクレジットカード情報取得
  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

end
