class EventsController < ApplicationController
  
  def index
    @events = Event.order('created_at desc').paginate(:page => params[:page], :per_page => 30)
  end
  
  def show
    begin
      @event = Event.find params[:id]
    rescue
      redirect_to not_found_path()
    end
  end

end
