require 'rails_helper'

RSpec.describe "photo locations meta data records api" do
  context "when the record exists" do
    it "returns the current users photos location meta data" do
      user = create(:user)
      metadata_1 = user.meta_data.create(lat: 12.44441, long: 122.445454)
      metadata_2 = user.meta_data.create(lat: 12.12323, long: 112.451234)
      metadata_3 = user.meta_data.create(lat: 12.65751, long: 132.445454)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get 'api/v1/metadata/photos/location'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["lat"]).to eq(metadata_1.lat)
      expect(result.first["long"]).to eq(metadata_1.long)
      expect(result.last["lat"]).to eq(metadata_3.lat)
      expect(result.last["long"]).to eq(metadata_3.long)
    end
  end
end
