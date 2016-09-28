class Api::ArticleController < ApplicationController

    def index
        @articles = Article.paginate(:page => params[:page], :per_page => 30)
        @json_articles = []
        for article in @articles
            @post = to_json article
            @json_articles << @post
        end
        render :json => @json_articles
    end
    
    def show
        @article = Article.find params[:id]
        
        render :json => to_json(@article)
    end
    
    private
    def to_json(article)
        {
            postId: article.id,
            postTitulo: article.title,
            postDescricao: ActionController::Base.helpers.strip_tags(article.description),
            postData: article.created_at,
            postAutorNome: article.user.name,
            postAutorMatricula: article.user.enrollment,
            postImagemUrl: "#{request.protocol}#{request.host}#{article.image.url}"
        }
    end

end
