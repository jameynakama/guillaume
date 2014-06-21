class Guillaume::Ngram
  def initialize(source)
    @source = source
  end

  def ngrams(n)
    result = []
    sentences.each do |sentence|
      result += sentence.split(" ").each_cons(n).to_a
    end
    result
  end

  def unigrams
    ngrams 1
  end

  def bigrams
    ngrams 2
  end

  def trigrams
    ngrams 3
  end

  def sentences
    @sentences ||= @source.split(/(?<=\.[ \r\n]|\?[ \r\n]|![ \r\n])/).map do |sentence|
      sentence.gsub(/[\r\n]+/, " ").strip
    end.reject(&:empty?)
  end
end
