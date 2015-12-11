class CardItem < ActiveRecord::Base
  extend Enumerize

  attr_accessor :is_black, :is_man

  enumerize :color, in: [:grey, :black], default: :grey
  enumerize :sex, in: [:man, :women], default: :man

  belongs_to :card
  belongs_to :session

  validates :size, presence: true, inclusion: { in: SHIRT_SIZES }
  validates :count, presence: true, inclusion: { in: 1..10 }

  scope :without_card, -> { where(card_id: nil) }

  def price
    SHIRT_PRICE * count
  end
end