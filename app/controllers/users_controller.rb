class UsersController < ApplicationController
  before_action :set_category
  
  def show
    @user = User.find(params[:id])
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
