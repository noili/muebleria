class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :error

  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to new_session_path, error: 'Inicie session' unless session[:user_id]
  end
end
