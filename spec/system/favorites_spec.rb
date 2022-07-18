require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let!(:store) { FactoryBot.create(:store, prefecture: "東京") }
  let(:user) { FactoryBot.create(:user) }
  before do
    sign_in_as(user)
    driven_by(:rack_test)
  end

  scenario "check the favorite function" do
    visit store_path(store)
      click_button "お気に入り登録"
    expect(page).to have_content "お気に入り取り消し"
  end

  scenario "check the favorite function" do
    visit store_path(store)
      click_button "お気に入り登録"
      click_button "お気に入り取り消し"
    expect(page).to have_content "お気に入り登録"
  end
end
