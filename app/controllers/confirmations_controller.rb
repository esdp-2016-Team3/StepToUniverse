class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        AdminUser.all.each do |admin|
         ToAdminMailer.reg_alert(admin).deliver_now
        end
        signed_in_root_path(resource)
      else
        AdminUser.all.each do |admin|
          ToAdminMailer.reg_alert(admin).deliver_now
        end
        new_session_path(resource_name)
      end
    end
end