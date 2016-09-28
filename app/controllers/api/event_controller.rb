class Api::EventController < ApplicationController

    def index
        @events = Event.paginate(:page => params[:page], :per_page => 30)
        @json_events = []
        for event in @events
            @post = to_json event
            @json_events << @post
        end
        render :json => @json_events
    end
    
    def show
        @event = Event.find params[:id]
        
        render :json => to_json(@event)
    end
    
    private
    def to_json(event)
        {
            eventoId: event.id,
            eventoTitulo: event.title,
            eventoDescricao: ActionController::Base.helpers.strip_tags(event.description),
            eventoData: event.date,
            eventoLocal: event.place,
            eventoCriador: event.user.name,
            eventoCriadorMatricula: event.user.enrollment,
            eventoImagemUrl: "#{request.protocol}#{request.host}#{event.image.url}"
        }
    end

end
