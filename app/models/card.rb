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
      description = self.card_items.map { |card_item| "#{card_item.count}/#{card_item.size} #{card_item.color.black? ? 'Black on Black' : 'White on Grey' } - $#{card_item.price}" }.join(', ')
      shipping_address = "#{self.shipping_first_name} #{self.shipping_last_name}, #{self.shipping_address_1}, #{self.shipping_address_2}, #{self.shipping_city}, #{self.shipping_state}, #{self.shipping_zip}" 
      billing_address = "#{self.billing_first_name} #{self.billing_last_name}, #{self.billing_address_1}, #{self.billing_address_2}, #{self.billing_city}, #{self.billing_state}, #{self.billing_zip}" 

      charge = Stripe::Charge.create(
        amount: self.amount * 100,
        currency: 'usd',
        source: self.stripe_token,
        description: description,
        metadata: { email: self.email,
                    shipping_address: shipping_address,
                    billing_address: billing_address }
      )

      self.stripe_id = charge.id
    rescue Stripe::StripeError => e
      errors.add(:card_number, e.message)
    end
  end
end

  

