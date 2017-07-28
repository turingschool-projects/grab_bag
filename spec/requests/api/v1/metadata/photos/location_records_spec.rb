require 'rails_helper'

RSpec.describe "photo locations meta data records api" do
  context "when the record exists" do
    it "returns the current users photos location meta data" do
      user = create(:user)
      metadata_1 = MetaDataPhoto.create(lat: 12.44441, long: 122.445454, user_id: user.id)
      metadata_2 = MetaDataPhoto.create(lat: 12.12323, long: 112.451234, user_id: user.id)
      metadata_3 = MetaDataPhoto.create(lat: 12.65751, long: 132.445454, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/meta_data/photos/locations'

      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(result.first["latitude"]).to eq(metadata_1.lat)
      expect(result.first["longitude"]).to eq(metadata_1.long)
      expect(result.last["latitude"]).to eq(metadata_3.lat)
      expect(result.last["longitude"]).to eq(metadata_3.long)
    end

    it "returns the current users photo location meta data sorted by year" do
      user = create(:user)
      # metadata_1 =
    end
  end
end
