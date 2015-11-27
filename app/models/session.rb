class Session < ActiveRecord::SessionStore::Session 
  # belongs_to :user 
  # before_save :ensure_user_is_set 

  has_many :card_items
  
  def self.find_by_session_id(session_id) 
    where(session_id: session_id).first
  end 

  def total_price
    card_items.sum(:count) * SHIRT_PRICE + SHIPPING_PRICE
  end
  
  # private 

  # def ensure_user_is_set 
  #   warden_data = self.data['warden.user.user.key']
     
  #   if warden_data 
  #     user_id = warden_data[1][0] 
  #     self.user = User.find(user_id) 
  #   end 
  # end 
end 