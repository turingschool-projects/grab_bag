require 'rails_helper'

RSpec.describe "users records api", type: :request do
  context "when the record exists" do
    it "returns the current user" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/user'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["username"]).to eq(user.username)
      expect(result["name"]).to eq(user.name)
      expect(result["email"]).to eq(user.email)
      expect(result["phone"]).to eq(user.phone)
    end
  end
end
