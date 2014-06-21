class Guillaume::Ngram
  attr_accessor :options

  def initialize(source, options = { regex: / / })
    @source = source
    @options = options
  end

  def ngrams(n)
    @source.split(@options[:regex]).each_cons(n).to_a
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
end
