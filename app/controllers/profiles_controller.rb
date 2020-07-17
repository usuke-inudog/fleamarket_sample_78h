class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  def index
  end

  def new
    if current_user.profile.present?
      @profile = current_user.profile
      redirect_to edit_profile_path(current_user.id)
    else
      @profile = Profile.new
    end
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
    if @profile.update(profile_params)
        redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :introduction, :avatar).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
