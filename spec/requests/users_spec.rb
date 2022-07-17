require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "as an authenticated user" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "returns http success" do
      sign_in @user
      get "/users/index"
      expect(response).to have_http_status(:success)
    end

    context "as a guest" do
      it "returns a 302 response" do
        get "/users/index"
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get "/users/index"
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
