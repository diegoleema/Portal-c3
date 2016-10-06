class Dashboard::AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  layout 'dashboard'
  
  def is_admin?
    current_user.admin?
  end
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource)
  end

end
