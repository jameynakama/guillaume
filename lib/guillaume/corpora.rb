class Guillaume::Corpora < ActiveRecord::Base
  has_and_belongs_to_many :source_texts

  validates_uniqueness_of :title

  def unigrams
    Guillaume::Unigram.where(source_text_id: self.source_texts)
  end

  def bigrams
    Guillaume::Bigram.where(source_text_id: self.source_texts)
  end

  def trigrams
    Guillaume::Trigram.where(source_text_id: self.source_texts)
  end

  def tetragrams
    Guillaume::Tetragram.where(source_text_id: self.source_texts)
  end
end
