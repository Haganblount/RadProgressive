class CardItem < ActiveRecord::Base
  belongs_to :card

  validates :size, presence: true, inclusion: { in: ['S', 'M', 'L', 'XL'] }
  validates :count, presence: true, inclusion: { in: 1..10 }
end