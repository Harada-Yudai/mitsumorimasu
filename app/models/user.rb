class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name , presence: true
  validates :first_name, presence: true
  validates :phone_num , numericality: { only_integer: true }, length: { in: 10..11 }

  has_many :clients
  has_many :projects
end
