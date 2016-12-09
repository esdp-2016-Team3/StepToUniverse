class User::RegistrationsController < Devise::RegistrationsController

before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:name, :skype, :phone, :description, :avatar, :position_id, :status, profile_answers_attributes: [:id, :answer, :question, :user_id])
    }
  end
end
