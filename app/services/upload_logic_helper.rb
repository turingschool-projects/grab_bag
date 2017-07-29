class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
    @queens_english = (%w(colour cheque theatre favourite flavour metre labour humour neighbour travelled travelling traveller fuelled fuelling defence))
  end

  def adjectives
    topword_adjectives
  end

  def nouns
    topword_nouns
  end

  def american?
    american_nouns
  end


  private
  attr_reader :user, :queens_english

  def american_nouns
    list = MetaDataFile.where(user_id: user.id)
    nouns = extract_words(list, "top_nouns")
    find_real_english(nouns)
  end

  def find_real_english(list)
    list = list
    output = queens_english.map do |word|
      if list.include?(word)
        true
      end
    end
    json_output = {}
    json_output[:commonwealth] = output.include?(true)
    json_output
  end

  def topword_nouns
    list = MetaDataFile.where(user_id: user.id)
    top_nouns = extract_words(list, "top_nouns")
    rank_words(top_nouns)
  end

  def topword_adjectives
    list = MetaDataFile.where(user_id: user.id)
    top_adjectives = extract_words(list, "top_adjectives")
    rank_words(top_adjectives)
  end

  def extract_words(list, type)
    output = []
    list.each do |data|
      words_array = []
      if type == "top_adjectives"
        words_array = data.top_adjective
      elsif type == "top_nouns"
        words_array = data.top_noun
      end
      words_array.each do |word|
        output << word.downcase
      end
    end
    output
  end

  def rank_words(words)
    words_ranking = Hash.new(0)
    words.each do |word|
      words_ranking[word] += 1
    end
    words_ranking.sort_by {|_key, value| value}.last(6).to_h
  end
end
