class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :accounts
  has_many :transactions, through: :accounts
  has_many :payments, through: :accounts
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
