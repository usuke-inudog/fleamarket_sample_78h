class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :set_show_instance, only:[:show]
  before_action :set_sell_instance, only:[:new, :create, :edit, :update]
  
  def index
  end

  def new
    @item = Item.new
    @item.build_brand
    4.times do
      @item.item_images.build
    end
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    if @item.seller_id == current_user.id && @item.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    @image_length = @item.item_images.length
    (4 - @item.item_images.length).times do
    @item.item_images.build
    end
    if @item.seller_id != current_user.id
      redirect_to new_item_path
    end

    # 孫と子のレコードを取得
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    
    # # 下３セットは親、子、孫と配列を作り、親はnameを、子と孫はancestryを格納
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update!(item_params)
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = '必須項目の内容を確認してください。'
      render 'edit'
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
    params.require(:item).permit(:name, :introduction, :price, [brand_attributes: [:id, :name]], :category_id, :item_condition, :delivery_burden, :delivery_method, :shipper, :shipping_day, :size, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_sell_instance
    @category_parent_array = ["選択して下さい"]
    @parents.each do |parent|
      @category_parent_array << parent.name
    end
  end
end
