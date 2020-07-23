class ShippingAddressesController < ApplicationController
  before_action :set_shipping_address, only: [:edit, :update]

  def new
    if current_user.shipping_address.present?
      @shipping_address = current_user.shipping_address
      redirect_to edit_shipping_address_path(@shipping_address.id)
    else
      @shipping_address = ShippingAddress.new
    end
  end

  def edit
  end

  def create
    @shipping_address = ShippingAddress.new(address_params)
    if @shipping_address.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = '必須項目は全て入力してください'
      render :new
    end
  end

  def update
    if @shipping_address.update(address_params)
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = '必須項目は全て入力してください'
      render 'edit'
    end
  end
  

  private
  def address_params
    params.require(:shipping_address).permit(:shipping_family_name, :shipping_first_name, :shipping_family_name_kana, :shipping_first_name_kana, :postal_code, :state_province, :city, :street, :building_number, :phone_number).merge(user_id: current_user.id)
  end

  def set_shipping_address
    @shipping_address = ShippingAddress.find(params[:id])
  end
end
