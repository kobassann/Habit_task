class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_beginning_of_week

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end
