class SessionsController < ApplicationController
  layout 'session'

  skip_before_action :authenticate_user, only: [:new, :create]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_client_path, success: 'Iniciaste sesion correctamente'
    else
      flash.now.alert = 'Email o Clave incorrectos'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path, notice: 'Cerraste sesion'
  end
end
