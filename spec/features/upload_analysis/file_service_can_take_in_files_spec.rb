require "rails_helper"

describe "file service captures metadata properly" do
  scenario "helper PORO works on docx files" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    folder = user.home
    binary = create :text_binary, folder: folder
    yomu_1 = Yomu.new('app/assets/tests/comp-grade-standards.docx')
    FileMetaDataService.new(yomu_1, user, binary.id).collect
    yomu_2 = Yomu.new('app/assets/tests/Essay Format Template.docx')
    FileMetaDataService.new(yomu_2, user, binary.id).collect

    files = MetaDataFile.where(user_id: user.id)
    expect(files[0]).to be_valid
    expect(files[1]).to be_valid
  end

  scenario "helper PORO works on ppt files" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    folder = user.home
    binary = create :text_binary, folder: folder
    yomu_1 = Yomu.new('app/assets/tests/BA-2 M4 Status template.ppt')
    FileMetaDataService.new(yomu_1, user, binary.id).collect
    yomu_2 = Yomu.new('app/assets/tests/BA-2 M4 Swimlane example.ppt')
    FileMetaDataService.new(yomu_2, user, binary.id).collect

    files = MetaDataFile.where(user_id: user.id)
    expect(files[0]).to be_valid
    expect(files[1]).to be_valid
  end

  scenario "helper PORO works on xlx files" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    folder = user.home
    binary = create :text_binary, folder: folder
    yomu_1 = Yomu.new('app/assets/tests/BA-2 M4 PM Toolbox EVA Template.xls')
    FileMetaDataService.new(yomu_1, user, binary.id).collect
    yomu_2 = Yomu.new('app/assets/tests/BA-2 M4 Readiness Review sample.xls')
    FileMetaDataService.new(yomu_2, user, binary.id).collect

    files = MetaDataFile.where(user_id: user.id)
    expect(files[0]).to be_valid
    expect(files[1]).to be_valid
  end


end
