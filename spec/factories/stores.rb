FactoryBot.define do
  factory :store do
    name { "MyString" }
    address { "MyString" }
    description { "MyText" }
    phone { "09043234322" }
    reserve_way { "MyString" }
    open { "MyString" }
    holiday { "MyString" }
    price { 1 }
    near_station { "MyString" }
    space_of_surf { "MyString" }
    prefecture { "MyString" }
    store_url { "MyString" }
    after(:build) do |store|
      store.image.attach(
        io: File.open(Rails.root.join('spec', 'files', 'shoes.jpeg')),
        filename: 'test.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
