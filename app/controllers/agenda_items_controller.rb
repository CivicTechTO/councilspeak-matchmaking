class AgendaItemsController < ApplicationController
  def index
    @agenda_items = AgendaItem.upcoming.order("meeting_date ASC")
    if params[:search] and not params[:search].blank?
      @agenda_items = @agenda_items.search(params[:search])
    end

    respond_to do |format|
      format.json { render json: @agenda_items }
    end
  end
end
