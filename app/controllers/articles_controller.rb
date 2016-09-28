class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at desc').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    begin
      @article = Article.find params[:id]
    rescue
      redirect_to not_found_path()
    end
  end
end
