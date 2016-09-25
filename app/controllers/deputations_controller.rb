class DeputationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
  end

  def create
    user_id = current_user.id

    @deputation = Deputation.new(deputation_params)
    @deputation.speaker_id = user_id

    @user = User.find(user_id).update!(user_params)

    @deputation.save!

    VolunteerMailer.new_deputation(@deputation).deliver

    flash[:success] = "Submitted video! You will receive an email when someone adopts it."
    redirect_to root_path
  end

private
  def deputation_params
    params.require(:deputation).permit(:agenda_item_id, :speaker_id, :video_url)
  end

  def user_params
    params.require(:user).permit(:name, :postal_address, :organization, :phone)
  end

  def authenticate_user!
    if current_user.anonymous?
      flash[:danger] = 'You must be logged in to submit a video! You may register via the form in the top-right of screen.'
      redirect_to root_path
    end
  end


  # TODO: Confirm YouTube video duration is under 2 minutes (plus a little forgiveness).
  # part:contentDetails and parse duration. Needs auth.
end
