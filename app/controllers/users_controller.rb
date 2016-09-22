class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update!(name: params[:user][:name])
    redirect_to users_path
  end

private

  def authenticate_user!
    if current_user.anonymous?
      flash[:danger] = 'Not authenticated'
      redirect_to root_path
    end
  end
end
