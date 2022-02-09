class Project < ApplicationRecord  

  validates :pro_day    , presence: true
  validates :pro_number , presence: true
  validates :pro_name   , presence: true

  # has_many :goods
  belongs_to :user
  belongs_to :client
end
