class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?




  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana, :first_kana, :company, :address, :phone_num,:info])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_kana, :first_kana, :company, :address, :phone_num,:info])
  end



end
