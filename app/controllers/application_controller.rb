class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if current_user.position_id==2
      teacher_cabinet_path
    else
      student_cabinet_path(current_user)
    end
  end

  private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :skype, :phone, :description, :avatar, :position_id, :status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :skype, :phone, :description, :avatar, :position_id, :status])
  end

end
