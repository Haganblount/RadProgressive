class Card < ActiveRecord::Base
  include Scopes
  
  attr_accessor :card_number, :card_year, :card_month, :card_cvv, :email_confirmation

  has_many :card_items, dependent: :destroy

  validates :email, confirmation: true, presence: true,  email: true, length: { maximum: 254 }
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
  validates :card_year, presence: true, numericality: true, length: { is: 2 }
  validates :card_month, presence: true, numericality: true, length: { is: 2 }
  validates :card_cvv, presence: true, numericality: true, length: { is: 3 }

  after_validation :set_card_number_errors
  before_validation :compare_shipping_and_billing

  def total_price
    card_items.sum(:count) * SHIRT_PRICE + SHIPPING_PRICE
  end
  
  private

  def set_card_number_errors
    errors.add(:card_number, "Card year #{errors[:card_year].first}") if errors[:card_year].any?
    errors.add(:card_number, "Card month #{errors[:card_month].first}") if errors[:card_month].any?
    errors.add(:card_number, "CVV #{errors[:card_cvv].first}") if errors[:card_cvv].any?
  end
  
  def compare_shipping_and_billing
    if billing_first_name.present? && shipping_first_name.present? &&
       billing_last_name.present? && shipping_last_name.present? &&
       billing_address_1.present? && shipping_address_1.present? &&
       billing_city.present? && shipping_city.present? &&
       billing_state.present? && billing_state.present? &&
       billing_zip.present? && billing_zip.present?
      
      if billing_first_name == shipping_first_name &&
         billing_last_name == shipping_last_name &&
         billing_address_1 == shipping_address_1 &&
         billing_city == shipping_city &&
         billing_state == shipping_state && 
         billing_zip == shipping_zip

         errors.add(:same_shiping, "Shipping Same as billing")
      end
    end
  end
end

  

