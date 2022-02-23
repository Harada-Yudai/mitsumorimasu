class Project < ApplicationRecord  

  validates :pro_name   , presence: true


  belongs_to :user
  belongs_to :client
  has_many :items
end
