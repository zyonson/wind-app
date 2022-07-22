FactoryBot.define do
  factory :comment do
    comment_title { "MyString" }
    comment_content { "MyString" }
    association :user
    association :store
  end
end
