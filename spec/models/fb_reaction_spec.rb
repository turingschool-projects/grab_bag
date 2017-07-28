require 'rails_helper'

RSpec.describe FbReaction do
  context 'attributes' do
    it 'responds to' do
      fb_reaction = FbReaction.new

      expect(fb_reaction).to respond_to(:fb_uid)
      expect(fb_reaction).to respond_to(:fb_uname)
      expect(fb_reaction).to respond_to(:reaction_type)
    end
  end

  describe "relationships" do
    it { should belong_to(:meta_data_photo) }
  end
end
