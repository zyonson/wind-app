require 'rails_helper'

RSpec.describe Store, type: :model do
  it "is invalid without a name" do
    store = build(:store, name: nil)
    store.valid?
    expect(store.errors[:name]).to include("を入力してください")
  end
  it "is invalid without a description" do
    store = build(:store, description: nil)
    store.valid?
    expect(store.errors[:description]).to include("を入力してください")
  end
  it "is invalid without a address" do
    store = build(:store, address: nil)
    store.valid?
    expect(store.errors[:address]).to include("を入力してください")
  end
  it "is invalid without a phone" do
    store = build(:store, phone: nil)
    store.valid?
    expect(store.errors[:phone]).to include("を入力してください")
  end
  it "is invalid without a reserve_way" do
    store = build(:store, reserve_way: nil)
    store.valid?
    expect(store.errors[:reserve_way]).to include("を入力してください")
  end
  it "is invalid without a open" do
    store = build(:store, open: nil)
    store.valid?
    expect(store.errors[:open]).to include("を入力してください")
  end
  it "is invalid without a holiday" do
    store = build(:store, holiday: nil, image: nil)
    store.valid?
    expect(store.errors[:holiday]).to include("を入力してください")
  end
  it "is invalid without a price" do
    store = build(:store, price: nil)
    store.valid?
    expect(store.errors[:price]).to include("を入力してください")
  end
  it "is invalid without a near_station" do
    store = build(:store, near_station: nil)
    store.valid?
    expect(store.errors[:near_station]).to include("を入力してください")
  end
  it "is invalid without a space_of_surf" do
    store = build(:store, space_of_surf: nil)
    store.valid?
    expect(store.errors[:space_of_surf]).to include("を入力してください")
  end
  it "is invalid without a prefecture" do
    store = build(:store, prefecture: nil)
    store.valid?
    expect(store.errors[:prefecture]).to include("を入力してください")
  end
  it "is invalid without a store_url" do
    store = build(:store, store_url: nil)
    store.valid?
    expect(store.errors[:store_url]).to include("を入力してください")
  end
end
