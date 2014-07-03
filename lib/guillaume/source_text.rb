require "uri"

class Guillaume::SourceText
  def initialize(file_name)
    @file_name = file_name
    @raw_source = File.open(file_name, "rb") { |f| f.read }
    @sentences = normalized.split(/(?<=\.|\?|!) /).reject(&:empty?)
  end

  def normalized
    @raw_source.gsub(/[\r\n ]+/, " ").strip
  end

  def ngrams(n)
    $LOGGER.info("Grabbing #{n}-grams from #{@file_name}...")
    result = []
    @sentences.each do |sentence|
      result += sentence.split(" ").each_cons(n).to_a
    end
    result
  end

  def unigrams
    @unigrams ||= ngrams 1
  end

  def bigrams
    @bigrams ||= ngrams 2
  end

  def trigrams
    @trigrams ||= ngrams 3
  end
end
