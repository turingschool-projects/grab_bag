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
      metadata_1 = MetaDataPhoto.create(lat: 12.44441, long: 122.445454, user_id: user.id, created_at: "19 Jul 1993")
      metadata_2 = MetaDataPhoto.create(lat: 12.12323, long: 112.451234, user_id: user.id, created_at: "19 Jul 1994")
      metadata_3 = MetaDataPhoto.create(lat: 12.65751, long: 132.445454, user_id: user.id, created_at: "19 Jul 1996")
      metadata_4 = MetaDataPhoto.create(lat: 14.44441, long: 142.445454, user_id: user.id, created_at: "19 Jul 1997")
      metadata_5 = MetaDataPhoto.create(lat: 14.12323, long: 142.451234, user_id: user.id, created_at: "19 Jul 1998")
      metadata_6 = MetaDataPhoto.create(lat: 14.65751, long: 142.445454, user_id: user.id, created_at: "19 Jul 1999")
      metadata_7 = MetaDataPhoto.create(lat: 14.4523, long: 132.454534, user_id: user.id, created_at: "20 Jul 1994")
      metadata_8 = MetaDataPhoto.create(lat: 19.12341, long: 112.417854, user_id: user.id, created_at: "20 Jul 1997")



      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/meta_data/photos/locations_by_year'

      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["1993"].first["latitude"]).to eq(metadata_1.lat)
      expect(result["1993"].first["longitude"]).to eq(metadata_1.long)
      expect(result["1997"].first["latitude"]).to eq(metadata_4.lat)
      expect(result["1997"].first["longitude"]).to eq(metadata_4.long)
      expect(result["1999"].first["latitude"]).to eq(metadata_6.lat)
      expect(result["1999"].first["longitude"]).to eq(metadata_6.long)
      expect(result["1994"].first["longitude"]).to eq(metadata_2.long)
      expect(result["1994"].last["longitude"]).to eq(metadata_7.long)
    end
  end
end
