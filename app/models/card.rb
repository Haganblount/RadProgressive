class Card < ActiveRecord::Base
  attr_accessor :card_number, :card_year, :card_month, :card_cvv, :email_confirmation

  has_many :card_items, dependent: :destroy

  validates :email, confirmation: true, uniqueness: true,  email: true, length: { maximum: 254 }
  validates :email_confirmation, presence: true, email: true
  validates :billing_first_name, presence: true, length: { maximum: 254 }
  validates :billing_last_name, presence: true, length: { maximum: 254 }
  validates :billing_address_1, presence: true, length: { maximum: 254 }
  validates :billing_address_2, length: { maximum: 254 }
  validates :billing_city, presence: true, length: { maximum: 254 }
  validates :billing_state, presence: true, length: { maximum: 2 }, inclusion: { in: US_STATES }
  validates :billing_zip, presence: true, 
                          length: { maximum: 5 }, 
                          postcode_format: { country_code: :us, message: "entered is not a valid postcode for US." }
  
  validates :shipping_first_name, presence: true, length: { maximum: 254 }
  validates :shipping_last_name, presence: true, length: { maximum: 254 }
  validates :shipping_address_1, presence: true, length: { maximum: 254 }
  validates :shipping_address_2, length: { maximum: 254 }
  validates :shipping_city, presence: true, length: { maximum: 254 }
  validates :shipping_state, presence: true, length: { maximum: 2 }, inclusion: { in: US_STATES }
  validates :shipping_zip, presence: true, 
                           length: { maximum: 5 },
                           postcode_format: { country_code: :us, message: "entered is not a valid postcode for US." }

  validates :card_number, presence: true, credit_card_number: true
  validates :card_year, presence: true, numericality: true, length: { is: 4 }
  validates :card_month, presence: true, numericality: true, length: { is: 2 }
  validates :card_cvv, presence: true, numericality: true, length: { is: 3 }
end

  

