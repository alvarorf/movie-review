class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  def homepage; end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fullname])
    # devise_parameter_sanitizer.for(:account_update).push(:username, :fullname)
 end
end
