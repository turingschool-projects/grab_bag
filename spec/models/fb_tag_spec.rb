require 'rails_helper'

RSpec.describe FbTag do
  context 'attributes' do
    it 'responds to' do
      fb_tag = FbTag.new

      expect(fb_tag).to respond_to(:fb_uid)
      expect(fb_tag).to respond_to(:fb_uname)
    end
  end

  describe "relationships" do
    it { should belong_to(:meta_data_photo) }
  end
end
