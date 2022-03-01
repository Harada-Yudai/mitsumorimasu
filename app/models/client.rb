class Client < ApplicationRecord

  validates :cli_last_name, presence: true
  validates :cli_first_name, presence: true
  validates :cli_phone_num, numericality: { only_integer: true }, length: { in: 10..11 }

  belongs_to :user
  has_many :projects
end
