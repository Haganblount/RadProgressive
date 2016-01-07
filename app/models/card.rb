class Card < ActiveRecord::Base
  include Scopes
  
  attr_accessor :card_number, :card_year, :card_month, :card_code, :email_confirmation, :stripe_token

  has_many :card_items, dependent: :destroy

  validates :stripe_token, presence: true
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

  after_validation :charge
  after_validation :clean_card_fields

  def clean_card_fields
    self.card_number, self.card_year, self.card_month, self.card_code = nil, nil, nil, nil
  end

  def total_price
    card_items.sum(:count) * SHIRT_PRICE 
  end
  
  def charge
    begin
      charge = Stripe::Charge.create(
        amount: self.amount * 100,
        currency: 'usd',
        source: self.stripe_token,
        description: self.email
      )

      self.stripe_id = charge.id
    rescue Stripe::StripeError => e
      errors.add(:card_number, e.message)
    end
  end
end

  

