# Classe mapeada do SessionsController do devise
# Alterar caso seja necessario adicionar algum metodo ou dar override em algum
class Users::SessionsController < Devise::SessionsController
   layout false
#before_action :configure_sign_in_params, only: [:create]

   def new
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
     super
   end


# if params[:redirect_to].present?
#   store_location_for(resource, params[:redirect_to])    
# end
# GET /resource/sign_in
#def new
#   super
#end

# POST /resource/sign_in
# def create
#   super
# end

# DELETE /resource/sign_out
# def destroy
#   super
# end

# protected

# If you have extra params to permit, append them to the sanitizer.
# def configure_sign_in_params
#   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
# end
end
