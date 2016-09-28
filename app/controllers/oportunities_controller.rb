class OportunitiesController < ApplicationController
  def index
    @oportunities = Oportunity.order('created_at desc').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    begin
      @oportunity = Oportunity.find params[:id]
    rescue
      redirect_to not_found_path()
    end
  end
end
