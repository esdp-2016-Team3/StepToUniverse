# Preview all emails at http://localhost:3000/rails/mailers/to_admin_mailer
class ToAdminMailerPreview < ActionMailer::Preview

  def to_admin_mail_preview
    ToAdminMailer.reg_alert
  end

end
