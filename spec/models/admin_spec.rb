require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is invalid without a email" do
    admin = build(:admin, email: nil)
    admin.valid?
    expect(admin.errors[:email]).to include("can't be blank")
  end
  it "is invalid without a encrypted_password" do
    admin = build(:admin, encrypted_password: nil)
    admin.valid?
    expect(admin.errors[:encrypted_password]).to include("can't be blank")
  end
  it "is invalid without a duplicate email" do
    admin1 = create(:admin, email: "atc@gmail.com")
    admin2 = build(:admin, email: admin1.email)
    admin2.valid?
    expect(admin2.errors[:email]).to include("has already been taken")
  end
  it "is invalid if email's length is less than 6 characters" do
    admin = build(:admin, email: "asa@s")
    admin.valid?
    expect(admin.errors[:email]).to include("is too short (minimum is 6 characters)")
  end
  it "is valid if email's length is more than or equal with 6 characters" do
    admin = build(:admin, email: "abcd@e")
    admin.valid?
    expect(admin).to be_valid
  end
end
