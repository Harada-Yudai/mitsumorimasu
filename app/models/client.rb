class Client < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone_num, presence: true

  # belongs_to :user
 # has_many :projects
end
