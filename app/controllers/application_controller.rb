class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def sign_in_path(resource)
        if current_user.role == 'admin'
          admin_page_path
        else
          author_page_path
        end
      end

    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:a_name, :date_of_birth, :email, :password, :password_confirmation, roles: []])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation])
    end
end
