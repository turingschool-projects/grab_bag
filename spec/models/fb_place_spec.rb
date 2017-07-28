require 'rails_helper'

RSpec.describe FbPlace do
  context 'attributes' do
    it 'responds to' do
      fb_place = FbPlace.new

      expect(fb_place).to respond_to(:fb_place_id)
      expect(fb_place).to respond_to(:name)
      expect(fb_place).to respond_to(:city)
      expect(fb_place).to respond_to(:country)
      expect(fb_place).to respond_to(:lat)
      expect(fb_place).to respond_to(:long)
    end
  end

  describe "relationships" do
    it { should have_many(:meta_data_photos) }
  end
end
