class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only:[:show, :destroy]
  before_action :set_show_instance, only:[:show]
  before_action :set_sell_instance, only:[:new, :create]
  
  def index
  end

  def new
    @item = Item.new
    @item.build_brand
    @item.item_images.build
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = '必須項目の内容を確認してください。'
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.seller_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        flash.now[:alert] = '商品の削除に失敗しました'
      end
    else
      redirect_to root_path
    end
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_show_instance
    @seller = User.find(@item.seller_id)
    @images = ItemImage.where(item_id: params[:id])
    @image_first = ItemImage.where(item_id: params[:id]).first
    @brand = Brand.find(@item.brand_id)
    @category_id = @item.category_id
    @grand_child = Category.find(@category_id)
    @child  = @grand_child.parent
    @parent = @child.parent
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, [brand_attributes: [:id, :name]], :category_id, :item_condition, :delivery_burden, :delivery_method, :shipper, :shipping_day, :size, {item_images_attributes: [:image, :_destroy, :id]}).merge(seller_id: current_user.id)
  end

  def set_sell_instance
    @category_parent_array = ["選択して下さい"]
    @parents.each do |parent|
      @category_parent_array << parent.name
    end
  end
end
