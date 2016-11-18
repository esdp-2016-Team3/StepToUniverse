class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        ToAdminMailer.reg_alert.deliver
        signed_in_root_path(resource)
      else
        ToAdminMailer.reg_alert.deliver
        new_session_path(resource_name)
      end
    end
end