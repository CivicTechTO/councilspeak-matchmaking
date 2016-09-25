class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    user_id = current_user.anonymous? ? params[:id] : current_user.id
    @user = User.find(user_id)
  end

  def update
    user_id = current_user.anonymous? ? params[:id] : current_user.id
    User.find(user_id).update!(user_params)
    flash[:info] = "Your account details have been updated!"
    redirect_to root_path
  end

private

  def authenticate_user!
    if current_user.anonymous?
      flash[:danger] = 'Not authenticated'
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :organization, :postal_address, :phone)
  end
end
