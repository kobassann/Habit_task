class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :set_time_zone, if: :member_signed_in?
  before_action :set_beginning_of_week

  # def after_sign_in_path_for(resource)
  #   member_path(resource)
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  # def set_time_zone
  #   Time.zone = current_member.time_zone
  # end

end
