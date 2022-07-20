FactoryBot.define do
  factory :comment do
    comment_content { "MyString" }
    user { nil }
    store { nil }
  end
end
