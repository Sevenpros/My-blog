class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # def current_user
  #   User.first
  # end
  # protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name bio])
  end
end
