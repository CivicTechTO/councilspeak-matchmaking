class SessionsController < ApplicationController
  # This is the action triggered by login link
  def create
    # We don't sign in users with expired tokens
    user = User.where(login_token: params[:token])
      .where('login_token_valid_until > ?', Time.now)
      .first

    if user
      # Here we nullify login token so it can't be reused
      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)

      self.current_user = user
      flash[:success] = "Sign-in successful"
      redirect_to root_path
    else
      flash[:danger] = "Invalid or expired login link"
      redirect_to root_path
    end
  end

  # Simple sign-out. Just set current user to NullUser
  def destroy
    self.current_user = NullUser.new
    flash[:info] = "Sign-out successful"
    redirect_to root_path
  end
end
