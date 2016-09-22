class DeputationsController < ApplicationController
  def new
  end

  def create
    @deputation = Deputation.new(deputation_params)
    @deputation.speaker_id = current_user.id

    @deputation.save!
    flash[:success] = "Submitted video! You will receive an email when someone adopts it."
    redirect_to root_path
  end

private
  def deputation_params
    params.require(:deputation).permit(:agenda_item_id, :speaker_id, :video_url)
  end

  # TODO: Confirm YouTube video duration is under 2 minutes (plus a little forgiveness).
  # part:contentDetails and parse duration. Needs auth.
end
