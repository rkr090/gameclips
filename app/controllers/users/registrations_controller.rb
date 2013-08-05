class Users::RegistrationsController < Devise::RegistrationsController
 
  before_filter :configure_permitted_parameters
 
  protected

    def after_sign_up_path_for(resource_or_scope)
      new_profile_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation)
      end

      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:email, :password, :password_confirmation, :current_password)
      end
    end
 
end
