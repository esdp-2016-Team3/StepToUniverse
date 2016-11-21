class ApplicationController < ActionController::Base
 DAYS_OF_THE_WEEK = %w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье]
  TIME = %w[07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 00 01 02 03 04 05 06]
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if resource.class == AdminUser
      admin_user_session
      admin_root_path
    elsif current_user.position_id==2
      teacher_cabinet_path
    elsif
      current_user.position_id==1
      student_cabinet_path(current_user)
    end
  end

  private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :skype, :phone, :description, :avatar, :position_id, :status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :skype, :phone, :description, :avatar, :position_id, :status])
  end

end
