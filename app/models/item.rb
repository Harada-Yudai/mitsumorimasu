class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :item_amount, presence: true

  belongs_to :project
end
