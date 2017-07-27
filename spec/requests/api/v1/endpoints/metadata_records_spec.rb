require 'rails_helper'

RSpec.describe "meta data records api" do
  context "when the record exists" do
    xit "returns the current users meta data" do
      user = create(:user)
      metadata = user.meta_datum.create()
      #create a meta data instance associated with user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get 'api/v1/metadata/photos/location'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result[])
      #expect meta data to be present and called upon
    end
  end
end
