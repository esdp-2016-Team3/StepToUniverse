class ToAdminMailer < ApplicationMailer
    default from: ENV['admin_email']

    def reg_alert(user)
        mail(to: user.email, subject: 'Новый пользователь зарегистрирован')
    end

    def confirm_alert(user)
      mail(to: user.email, subject: 'Подтверждение')
    end

    def reject_alert(user)
      mail(to: user.email, subject: 'Отказ')
    end

end
