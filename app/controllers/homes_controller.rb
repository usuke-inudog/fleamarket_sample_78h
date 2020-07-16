class HomesController < ApplicationController
  before_action :set_category
  
  def index
    @item_images = ItemImage.all.order("created_at DESC").first(4)
    @items = Item.all.order("created_at DESC").first(4)
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
