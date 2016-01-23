class Guillaume::Ngram < ActiveRecord::Base
  belongs_to :source_text

  validates_presence_of :source_text

  def self.as_array
    pluck(:ngram).map { |ng| ng.split("||") }
  end
end

class Guillaume::Unigram < Guillaume::Ngram
end

class Guillaume::Bigram < Guillaume::Ngram
end

class Guillaume::Trigram < Guillaume::Ngram
end

class Guillaume::Tetragram < Guillaume::Ngram
end

