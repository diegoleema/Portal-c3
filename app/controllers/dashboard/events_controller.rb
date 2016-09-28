class Dashboard::EventsController < Dashboard::AuthenticatedController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.order('created_at desc').paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to dashboard_events_url, notice: 'Evento criado com sucesso.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to dashboard_events_url, notice: 'Evento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_events_url, notice: 'Evento removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = Event.find_by_id params[:id]
  end

  def event_params
    params.require(:event).permit(:title, :description, :id, :place, :date, :image)
  end
end
