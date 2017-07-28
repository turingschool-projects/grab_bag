require 'rails_helper'

describe "can receive json information do" do
  it "api endpoint returns information" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    folder = user.home
    binary = create :text_binary, folder: folder
    yomu_1 = Yomu.new('app/assets/tests/comp-grade-standards.docx')
    FileMetaDataService.new(yomu_1, user, binary.id).collect
    yomu_2 = Yomu.new('app/assets/tests/Essay Format Template.docx')
    FileMetaDataService.new(yomu_2, user, binary.id).collect
    yomu_3 = Yomu.new('app/assets/tests/Overview_of_HighGrowth_Inc_Valuation.docx')
    FileMetaDataService.new(yomu_3, user, binary.id).collect

    get '/api/v1/file/topwords'
    result = JSON.parse(response.body)

    expect(result["adjectives"]).to be_a Hash
    expect(result["nouns"]).to be_a Hash
  end
end
