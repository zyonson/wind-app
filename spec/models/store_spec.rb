require 'rails_helper'

RSpec.describe Store, type: :model do
  it "is invalid without a name" do
    store = build(:store, name: nil)
    store.valid?
    expect(store.errors[:name]).to include("can't be blank")
  end
  it "is invalid without a reserve_way" do
    store = build(:store, reserve_way: nil)
    store.valid?
    expect(store.errors[:reserve_way]).to include("can't be blank")
  end
  it "is invalid without a open" do
    store = build(:store, open: nil)
    store.valid?
    expect(store.errors[:open]).to include("can't be blank")
  end
  it "is invalid without a holiday" do
    store = build(:store, holiday: nil, image: nil)
    store.valid?
    expect(store.errors[:holiday]).to include("can't be blank")
  end
  it "is invalid without a price" do
    store = build(:store, price: nil)
    store.valid?
    expect(store.errors[:price]).to include("can't be blank")
  end
  it "is invalid without a near_station" do
    store = build(:store, near_station: nil)
    store.valid?
    expect(store.errors[:near_station]).to include("can't be blank")
  end
  it "is invalid without a space_of_surf" do
    store = build(:store, space_of_surf: nil)
    store.valid?
    expect(store.errors[:space_of_surf]).to include("can't be blank")
  end
  it "is invalid without a prefecture" do
    store = build(:store, prefecture: nil)
    store.valid?
    expect(store.errors[:prefecture]).to include("can't be blank")
  end
  it "is invalid without a store_url" do
    store = build(:store, store_url: nil)
    store.valid?
    expect(store.errors[:store_url]).to include("can't be blank")
  end
end
