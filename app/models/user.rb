class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 30 }
  validates :encrypted_password, presence: true

  def favorite_find(store_id)
    favorites.where(store_id: @store_id).exists?
  end
end
