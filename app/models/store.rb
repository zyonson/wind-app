class Store < ApplicationRecord
  has_one_attached :image
  belongs_to :admin, optional: true
  with_options presence: true do
    validates :reserve_way
    validates :open
    validates :holiday
    validates :price
    validates :near_station
    validates :space_of_surf
    validates :prefecture
    validates :store_url
  end
  validates :name, presence: true, uniqueness: true
end
