class Dashboard::OportunitiesController < Dashboard::AuthenticatedController
  before_action :set_oportunity, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @oportunities = Oportunity.order('created_at desc').paginate(:page => params[:page], :per_page => 10)
    else
      @oportunities = Oportunity.where(user_id: current_user.id).order('created_at desc').paginate(:page => params[:page], :per_page => 10)
    end
  end


  def show
  end

  def new
    @oportunity = Oportunity.new
  end

  def edit
  end

  def create
    @oportunity = Oportunity.new(oportunity_params)
    @oportunity.user = current_user

    respond_to do |format|
      if @oportunity.save
        format.html { redirect_to @oportunity, notice: 'Oportunidade criada com sucesso.' }
        format.json { render :show, status: :created, location: @oportunity }
      else
        format.html { render :new }
        format.json { render json: @oportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @oportunity.update(oportunity_params)
        format.html { redirect_to @oportunity, notice: 'Oportunidade atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @oportunity }
      else
        format.html { render :edit }
        format.json { render json: @oportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @oportunity.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_oportunities_url, notice: 'Oportunidade removida!' }
      format.json { head :no_content }
    end
  end

  private
    def set_oportunity
      @oportunity = Oportunity.find(params[:id])
    end

    def oportunity_params
      params.require(:oportunity).permit!
    end
end
