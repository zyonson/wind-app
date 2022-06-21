require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it "is invalid if name's length is more than 20 characters" do
    user = build(:user, name: "a" * 21)
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 20 characters)")
  end
  it "is valid if name's length is equal with 20 characteres" do
    user = build(:user, name: 'a' * 20)
    user.valid?
    expect(user).to be_valid
  end
  it "is invalid without a email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid without a encrypted_password" do
    user = build(:user, encrypted_password: nil)
    user.valid?
    expect(user.errors[:encrypted_password]).to include("can't be blank")
  end
  it "is invalid without a duplicate email" do
    user1 = create(:user, email: "atc@gmail.com")
    user2 = build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
  it "is invalid if email's length is less than 6" do
    user = build(:user, email: "asa@s")
    user.valid?
    expect(user.errors[:email]).to include("is too short (minimum is 6 characters)")
  end
end
