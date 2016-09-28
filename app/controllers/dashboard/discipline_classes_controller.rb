class Dashboard::DisciplineClassesController < Dashboard::AuthenticatedController
  before_action :set_class, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @classes = DisciplineClass.eager_load(:discipline).paginate(:page => params[:page], :per_page => 10)
    else
      @classes = current_user.classes.eager_load(:discipline).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @class = DisciplineClass.new
  end

  def edit
  end

  def create
    args = class_param
    files = args[:attachment_array]
    args.delete :attachment_array
    @class = DisciplineClass.new(args)
    @class.user = current_user
    respond_to do |format|
      if @class.save
        @class.attachments_array = files
        format.html { redirect_to dashboard_discipline_classes_url }
        format.json { render :show, status: :created, location: @dashboard_discipline }
      else
        format.html { render :new }
        format.json { render json: @dashboard_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    args = class_param
    files = args[:attachment_array]
    args.delete :attachment_array
    respond_to do |format|
      if @class.update(args)
        @class.attachments_array = files
        ClassFile.destroy_all id: params[:destroy_files]
        format.html { redirect_to dashboard_discipline_classes_url }
        format.json { render :show, status: :ok, location: @dashboard_discipline }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/disciplines/1
  # DELETE /dashboard/disciplines/1.json
  def destroy
    @class.attachments.destroy
    @class.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_discipline_classes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_class
      @class = DisciplineClass
                   .eager_load(:class_files)
                   .find(params[:id])
    end

  def class_param
    params.require(:discipline_class).permit!
  end

  def file_param
    params.require(:file).permit!
  end
end
