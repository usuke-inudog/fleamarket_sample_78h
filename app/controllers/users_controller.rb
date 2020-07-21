class UsersController < ApplicationController
  before_action :set_category
  
  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to action: "update"
    end
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
