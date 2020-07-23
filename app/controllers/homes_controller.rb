class HomesController < ApplicationController
  before_action :set_category
  
  def index
    @items = Item.all.order("updated_at DESC").limit(4)
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
