require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:user1) { FactoryBot.create(:user) }
  let(:store) { FactoryBot.create(:store, name: "ウインド") }

  scenario "after login, visits users_index" do
    sign_in_as(user)
    expect(page).to have_current_path users_path
  end

  scenario "without login, redirect_to sign_in" do
    visit stores_path
    visit users_path
    expect(page).to have_current_path new_user_session_path
  end

  scenario "after login, visits users_show" do
    sign_in_as(user)
    visit user_path(user)
    expect(page).to have_current_path user_path(user)
  end

  scenario "visit other user's show, redirect_to own index" do
    sign_in_as(user)
    visit user_path(user1)
    expect(page).to have_current_path "/users/index"
  end

  scenario "display the own favorite store" do
    sign_in_as(user)
    Favorite.create(user_id: user.id, store_id: store.id)
    visit users_path(user)
    expect(page).to have_content "ウインド"
  end
end
