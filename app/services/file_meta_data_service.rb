class FileMetaDataService

  def initialize(meta_object, current_user, binary_id = nil)
    @yomu = meta_object
    @user = current_user
    @binary_id = binary_id.to_i
    @tgr = EngTagger.new
  end

  def collect
    text = yomu.text.to_s.delete!("\n")
    words = text_detector(text)
    MetaDataFile.create!(text: text,
                      word_count: text.length,
                      top_adjective: rank_words(words, :adjectives),
                      top_noun: rank_words(words, :nouns),
                      user_id: @user.id,
                      binaries_id: binary_id)

  end

  private

  attr_reader :yomu, :user, :tgr, :binary_id

  def text_detector(text)
    output = {}
    tags = tgr.add_tags(text)
    output[:adjectives] = collect_adjectives(tgr, tags)
    output[:nouns] = collect_nouns(tgr, tags)
    output
  end

  def collect_adjectives(tgr, tags)
    tgr.get_adjectives(tags)
  end

  def collect_nouns(tgr, tags)
    tgr.get_nouns(tags)
  end

  def rank_words(words, type)
    output = []
    words[type].sort_by{ |k, v| v }.last(50).each do |words|
      output << words[0]
    end
    output
  end
end
