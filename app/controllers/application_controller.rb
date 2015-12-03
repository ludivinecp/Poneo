class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'carrierwave/orm/activerecord'
  protect_from_forgery with: :exception

  # before_action :configure_devise_permitted_parameters, if: :devise_controller?
  def authenticate_admin!
    unless current_user.admin
      redirect_to root_path, alert: "Accès refusé"
    end
  end

  def authenticate_center!
    unless !!current_user.centre
      redirect_to root_path, alert: "Accès refusé"
    end
  end

  def authenticate_rider!
    unless !!current_user.rider
      redirect_to root_path, alert: "Accès refusé"
    end
  end


  # protected

  # def configure_devise_permitted_parameters
  #   registration_params = [:nickname, :email, :password, :password_confirmation]

  #   if params[:action] == 'update'
  #     devise_parameter_sanitizer.for(:account_update) { 
  #       |u| u.permit(registration_params << :current_password)
  #     }
  #   elsif params[:action] == 'create'
  #     devise_parameter_sanitizer.for(:sign_up) { 
  #       |u| u.permit(registration_params) 
  #     }
  #   end
  # end
end
