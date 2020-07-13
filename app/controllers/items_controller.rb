class ItemsController < ApplicationController
  before_action :set_category
  
  def index
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.item_images.build
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      # @item.item_images.new
      flash.now[:alert] = '必須項目の内容を確認してください。'
      render :new
    end
  end

  def show
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, [brand_attributes: [:id, :name]], :category_id, :item_condition, :delivery_burden, :delivery_method, :shipper, :shipping_day, :size, {item_images_attributes: [:image, :_destroy, :id]}).merge(seller_id: current_user.id)
  end
end
