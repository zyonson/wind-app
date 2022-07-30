require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:store) { FactoryBot.create(:store) }

  before do
    sign_in_as(user)
    driven_by(:rack_test)
  end

  scenario "check the comment function" do
    visit store_path(store)
    fill_in "comment[comment_title]", with: "最高"
    fill_in "comment[comment_content]", with: "安い"
    click_button "コメントする"
    expect(page).to have_content "コメント数1件"
  end

  scenario "" do
    visit store_path(store)
    fill_in "comment[comment_content]", with: "安い"
    expect(page).to have_content "コメント数0件"
  end
end
