class Dashboard::ProfileController < Dashboard::AuthenticatedController

  def index

  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        current_user.profile.update(profile_params)
        sign_in(current_user, :bypass => true)
        flash['alert alert-success'] = 'Usuário atualizado com sucesso.'
        format.html { redirect_to dashboard_root_path }
        format.json { render :index, status: :ok, location: current_user }
      else
        format.html { render :index }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    user = params.require(:user).permit!
    if user[:password].nil? or user[:password].empty?
      user.delete :password
      user.delete :password_confirmation
    end
    user
  end

  def profile_params
    params.require(:user_profile).permit!
  end
end
