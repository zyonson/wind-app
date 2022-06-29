FactoryBot.define do
  factory :store do
    name { "MyString" }
    address { "MyString" }
    description { "MyText" }
    phone { "MyText" }
    reserve_way { "MyString" }
    open { "MyString" }
    holiday { "MyString" }
    price { 1 }
    near_station { "MyString" }
    space_of_surf { "MyString" }
    prefecture { "MyString" }
    store_url { "MyString" }
  end
end
