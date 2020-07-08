class CategoriesController < ApplicationController
  before_action :set_category
  
  def index
  end

  def show
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
