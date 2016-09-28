class Dashboard::AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout 'dashboard'
  
  def is_admin?
    current_user.admin?
  end
  
end
