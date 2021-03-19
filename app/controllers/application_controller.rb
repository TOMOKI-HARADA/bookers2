class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, only: [:show]
# before_action :authenticate_user!
#          before_action :ensure_current_user,only: [:show, :edit]
    #   before_action :authenticate_user!
#   before_action :correct_user, only: [:edit, :update]
def after_sign_in_path_for(resource)
  user_path(resource.id)
end

     protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])

  end
end
