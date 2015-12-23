class Subscribe < ActiveRecord::Base
  include Scopes
  
  validates :email, presence: true,  email: true, length: { maximum: 254 }, uniqueness: true

  after_create :mailchimp_subscribe

  private

  def mailchimp_subscribe               
    begin
      SubscribeMailer.send_subscribe(self).deliver
      gibbon = Gibbon::Request.new
      result = gibbon.lists(ENV['MAILCHIMP_API_LIST_ID']).members.create(body: { email_address: email, status: 'subscribed' })
      self.update_attribute(:mailchimp_id, result['id'])
    rescue Gibbon::MailChimpError => exception
      Rails.logger.error("failed becuz #{exception.detail}")
    end
  end
end
