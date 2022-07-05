require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    user = FactoryBot.create(:user)
    sign_in user
    get users_path
  end

  describe "GET /index" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
  end
end
