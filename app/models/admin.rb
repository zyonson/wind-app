class Admin < ApplicationRecord
  has_many :products, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 30 }
  validates :encrypted_password, presence: true
end
