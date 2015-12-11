class Session < ActiveRecord::SessionStore::Session 
  has_many :card_items
  
  def self.find_by_session_id(session_id) 
    where(session_id: session_id).first
  end 

  def total_price
    card_items.sum(:count) * SHIRT_PRICE
  end
end 