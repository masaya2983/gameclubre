class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_root_path
    else
      user_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_root_path
    else
      root_path
    end
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
