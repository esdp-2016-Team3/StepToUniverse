class ApplicationMailer < ActionMailer::Base
  default from: ENV['admin_email']
  layout 'mailer'
end
