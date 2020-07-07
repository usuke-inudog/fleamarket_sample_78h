class CategoriesController < ApplicationController
  def index
    # 現在カテゴリーの親階層は13種類のため、limit(13)
    @parents = Category.order("id ASC").limit(13)
  end

  def show
    
  end
end
