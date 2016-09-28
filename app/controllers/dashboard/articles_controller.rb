class Dashboard::ArticlesController < Dashboard::AuthenticatedController
  before_action :set_dashboard_article, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @dashboard_articles = Article.order('articles.created_at desc').paginate(:page => params[:page], :per_page => 30).eager_load(:user)
    else
      @dashboard_articles = current_user.articles.order('articles.created_at desc').paginate(:page => params[:page], :per_page => 30).eager_load(:user)
    end
  end
  
  def new
    @dashboard_article = Article.new
  end

  def edit
    if @dashboard_article.user_id != current_user.id
      redirect_to dashboard_article_path
    end
  end

  def create
    @dashboard_article = Article.new(dashboard_article_params)
    @dashboard_article.user_id = current_user.id
    respond_to do |format|
      if @dashboard_article.save
        format.html { redirect_to dashboard_articles_url, notice: 'Notícias criada com sucesso.' }
        format.json { render :index, status: :created, location: @dashboard_article }
      else
        format.html { render :new }
        format.json { render json: @dashboard_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dashboard_article.update(dashboard_article_params)
        format.html { redirect_to dashboard_articles_url, notice: 'Notícia atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @dashboard_article }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dashboard_article.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dashboard_article
      @dashboard_article = Article.find(params[:id])
    end

    def dashboard_article_params
      article = params.require(:article).permit(:title, :image, :description)
      if article[:image].nil?
        article.delete :image
      end
      article
    end
end
