class BaseMailer < ActionMailer::Base
  default from: 'admin@feelthefuckingbern.com'
  layout 'mailer'

  def admins
    User.select(:email).map(&:email)
  end
end
