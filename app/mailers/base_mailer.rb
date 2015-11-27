class BaseMailer < ActionMailer::Base
  default from: 'admin@feelthefuckingbern.com'

  def admins
    User.select(:email).map(&:email)
  end
end
