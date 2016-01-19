class Session < ActiveRecord::SessionStore::Session 
  include Scopes
  
  has_many :card_items
  
  #attr_accessor :email_confirmation

  #validates :email, confirmation: true, presence: true,  email: true, length: { maximum: 254 }
  #validates :email_confirmation, presence: true, email: true

  def self.find_by_session_id(session_id) 
    where(session_id: session_id).first
  end 

  def total_price
    card_items.without_card.sum(:count) * SHIRT_PRICE
  end
end 