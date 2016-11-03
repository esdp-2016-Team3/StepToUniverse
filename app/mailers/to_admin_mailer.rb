class ToAdminMailer < ApplicationMailer
    default from: "Step_To_Universe_Bot"

    def reg_alert
      mail(to: 'esdp20163@gmail.com', subject: 'Новый пользователь зарегистрирован')
    end

    def confirm_alert(user)
      mail(to: user.email, subject: 'Подтверждение')
    end

    def reject_alert(user)
      mail(to: user.email, subject: 'Отказ')
    end

end
