class ToAdminMailer < ApplicationMailer
    default from: "esdp20163@gmail.com"

    def reg_alert(user)
      mail(to: 'esdp20163@gmail.com', subject: 'Новый пользователь зарегистрирован')
    end

    def confirm_alert(user)
      mail(to: user.email, subject: 'Подтверждение')
    end

    def reject_alert(user)
      mail(to: user.email, subject: 'Отказ')
    end

end
