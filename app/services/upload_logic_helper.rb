class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
  end

  def topword_adjective
    list = MetaDataFile.where(user_id: user.id)
    binding.pry
    top_adjectives = extract_words(list)
    rank_words(top_adjectives)
  end

  private
  attr_reader :user

  def extract_words(list)
    output = []
    list.each do |data|
      words_array = data.top_adjective
      words_array.each do |word|
        output << word
      end
    end
    output
  end

  def extract_nouns(list)
  end

  def rank_words(words)
    words_ranking = Hash.new
    words.each do |word|
      binding.pry
      words_ranking[word] += 1
    end
    binding.pry
  end
end
