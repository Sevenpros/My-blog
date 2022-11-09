class ConfirmationsController < Devise::ConfirmationsController
  private

  method argument
  def after_confirmation_path_for(_resource_name, resource)
    sign_in(resource)
    users_path
  end
  method argument
end
