class FileMetaDataService

  def initialize(meta_object, current_user)
    @yomu = meta_object
    @user = current_user
  end

  def collect
    text = yomu.text.to_s.delete!("\n")
    MetaData.create!(text: text,
                      word_count: text.length,
                      user_id: @user.id)
  end

  private

  attr_reader :yomu, :user
end
