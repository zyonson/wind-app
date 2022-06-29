class Store < ApplicationRecord
  has_one_attached :image
  belongs_to :admin, optional: true
  with_options presence: true do
    validates :address
    validates :description
    validates :phone
    validates :reserve_way
    validates :open
    validates :holiday
    validates :price
    validates :near_station
    validates :space_of_surf
    validates :prefecture
    validates :store_url
    validates :image
  end
  validates :name, presence: true, uniqueness: true
  validates :phone, format:
  { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}
  [-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/ }
end
