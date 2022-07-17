require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:store) { FactoryBot.create(:store, prefecture: "東京") }

  scenario "display stores_index page" do
    visit stores_path
    expect(page).to have_current_path stores_path
  end

  scenario "search no store" do
    visit stores_path
    within("#search") do
      fill_in "q[name_or_prefecture_or_address_cont]", with: "沖縄"
      click_button "検索"
    end
    expect(page).to have_content "検索結果:0件"
  end

  scenario "search" do
    visit stores_path
    within("#search") do
      fill_in "q[name_or_prefecture_or_address_cont]", with: "東京"
      click_button "検索"
    end
    expect(page).to have_content "検索結果:1件"
  end

  scenario "check the store's registories function" do
    visit new_admin_session_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    visit new_admins_store_path
    fill_in "store[name]", with: "ポポロ"
    fill_in "store[address]", with: "埼玉県大谷市"
    fill_in "store[description]", with: "便利"
    fill_in "store[phone]", with: "090-0909-0909"
    fill_in "store[reserve_way]", with: "ネット"
    fill_in "store[open]", with: "12-20"
    fill_in "store[holiday]", with: "金曜日"
    fill_in "store[price]", with: "15000"
    fill_in "store[near_station]", with: "大谷駅"
    attach_file "store[image]", "spec/files/shoes.jpeg"
    fill_in "store[space_of_surf]", with: "あり"
    fill_in "store[prefecture]", with: "埼玉県"
    fill_in "store[store_url]", with: "https://www.speedwall.net/"
    click_button "作成"
    expect(page).to have_content "Storeが正常に作成されました"
  end
end
