class Client < ApplicationRecord

  validates :cli_last_name, presence: true
  validates :cli_first_name, presence: true
  validates :cli_phone_num, presence: true

  belongs_to :user
  has_many :projects
end
