class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :cli_last_name , presence: true
  validates :cli_first_name, presence: true
  validates :cli_phone_num , presence: true

  # has_many :clients
  # has_many :projects
end
