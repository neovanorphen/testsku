class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout 'admin_lte_2'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :remember_me,:created_at) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :password, :password_confirmation, :remember_me, :current_password) }
    devise_parameter_sanitizer.for(:edit_user_path) { |u| u.permit( :email, :password, :password_confirmation, :remember_me, :current_password) }

  end


  def home
    render "static_page/home"
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
