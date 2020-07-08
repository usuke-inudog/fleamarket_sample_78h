class ProfilesController < ApplicationController
  def index
  end
  
  def new
    @profile = Profile.new
    # @profile = Profile.find(params[:id])
    # if @profile
    #     render 'edit'
    # else
    #     render 'create'
    # end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
        redirect_to root_path
    else
        render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def profile_params
    params.require(:profile).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :introduction, :avatar).merge(user_id: current_user.id)
  end
end
