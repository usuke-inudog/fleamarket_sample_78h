class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128

  validates :nickname, presence: true, uniqueness: true

  has_one :profile
  has_one :credit_card
  has_many :items
  has_one :shipping_address
  has_many :comments
end
