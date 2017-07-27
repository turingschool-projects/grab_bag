require 'rails_helper'

RSpec.describe FbComment do
  context 'attributes' do
    it 'responds to' do
      fb_comment = FbComment.new

      expect(fb_comment).to respond_to(:fb_uid)
      expect(fb_comment).to respond_to(:fb_uname)
      expect(fb_comment).to respond_to(:like_count)
      expect(fb_comment).to respond_to(:comment_count)
      expect(fb_comment).to respond_to(:message)
    end
  end

  describe "relationships" do
    it { should belong_to(:meta_data_photo) }
  end
end
