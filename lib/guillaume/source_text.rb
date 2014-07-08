require "uri"

DELIMITER = "||"

class Guillaume::SourceText < ActiveRecord::Base
  has_and_belongs_to_many :corporas
  has_many :ngrams
  attr_accessor :file_name

  before_save :record_raw_source

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :file_name

  def sentences
    @sentence ||= normalized.split(/(?<=\.|\?|!) /).reject(&:empty?)
  end

  def normalized
    self.raw_source.gsub(/[\r\n ]+/, " ").strip
  end

  def get_ngrams(n)
    result = []
    sentences.each do |sentence|
      result += sentence.split(" ").each_cons(n).to_a
    end
    result
  end

  def unigrams
    self.ngrams.where(type: Guillaume::Unigram)
  end

  def bigrams
    self.ngrams.where(type: Guillaume::Bigram)
  end

  def trigrams
    self.ngrams.where(type: Guillaume::Trigram)
  end

  def tetragrams
    self.ngrams.where(type: Guillaume::Tetragram)
  end

  def record_ngrams
    [Guillaume::Unigram, Guillaume::Bigram, Guillaume::Trigram, Guillaume::Tetragram].each_with_index do |clazz, i|
      get_ngrams(i + 1).each do |tg|
        ngram = clazz.new
        ngram.ngram = tg.join(DELIMITER)
        ngram.key = tg[0...-1].join(DELIMITER)
        ngram.value = tg[-1]
        ngram.source_text = self
        ngram.save
      end
    end
  end

  private

  def record_raw_source
    self.raw_source = File.open(self.file_name, "rb") { |f| f.read }.force_encoding("UTF-8")
  end
end
