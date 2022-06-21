class Store < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :reserve_way
    validates :open
    validates :holiday
    validates :price
    validates :near_station
    validates :space_of_surf
  end
end
