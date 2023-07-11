class ApplicationController < ActionController::Base
  before_action :configure_sign_up_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
  
  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
