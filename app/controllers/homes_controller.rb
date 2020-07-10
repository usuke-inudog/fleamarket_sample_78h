class HomesController < ApplicationController
  before_action :set_category
  
  def index
    @item_images = ItemImage.all
    @items = Item.all
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
