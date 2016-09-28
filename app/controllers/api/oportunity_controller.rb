class Api::OportunityController < ApplicationController

    def index
        @oportunities = Oportunity.paginate(:page => params[:page], :per_page => 30)
        @json_oportunities = []
        for oportunity in @oportunities
            @post = to_json oportunity
            @json_oportunities << @post
        end
        render :json => @json_oportunities
    end
    
    def show
        @oportunity = Oportunity.find params[:id]
        
        render :json => to_json(@oportunity)
    end
    
    private
    def to_json(oportunity)
        oportunity.to_json
        {
            oportunidadeId: oportunity.id,
            oportunidadeTitulo: oportunity.title,
            oportunidadeDescricao: ActionController::Base.helpers.strip_tags(oportunity.description),
            oportunidadeData: oportunity.created_at,
            oportunidadeEmpresa: oportunity.employer,
            oportunidadeImagemUrl: "#{request.protocol}#{request.host}#{oportunity.image.url}"
        }
    end

end
