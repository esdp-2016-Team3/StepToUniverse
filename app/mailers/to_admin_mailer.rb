class ToAdminMailer < ApplicationMailer
    default from: "Step_To_Universe_Bot"

    def reg_alert
      mail(to: 'esdp20163@gmail.com', subject: 'New registration')
    end

end
