class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999, message: 'を正しく入力してください' }
  validates :item_amount, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999, message: 'を正しく入力してください' }

  belongs_to :project
end
