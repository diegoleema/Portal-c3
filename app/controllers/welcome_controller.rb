# Esse controller é utilizado apenas para
# páginas simples na página que o usuário não
# autenticado pode ver
class WelcomeController < ApplicationController

  # A página principal '/' do portal
  # Deve:
  # - Mostrar os 5 últimos posts
  # - Mostrar os 5 últimos eventos
  def index
    @latest_articles = Article.last(5).reverse
    @latest_events = Event.last(5).reverse
    
  end
  
  # Link para página de "Sobre"
  def about
  
  end
  
  # Link para página de "404 not found"
  def not_found
  
  end
end