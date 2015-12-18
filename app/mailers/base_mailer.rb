class BaseMailer < ActionMailer::Base
  default from: 'admin@radprogressive.com'
  layout 'mailer'

  def admins
    User.select(:email).map(&:email)
  end
end
