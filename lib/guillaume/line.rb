class Guillaume::Line
  def initialize(seed = nil)
    @line_parts = seed.split(/ /)
  end

  def build(ngrams)
    begin
      @line_parts << next_word(ngrams)
    end until @line_parts.last.nil?
    @line_parts.join(" ")
  end

  def next_word(ngrams, options = { look_behind: 1 })
    search_words = @line_parts[-options[:look_behind]..-1]
    choose_word(ngram_matches(ngrams, search_words))
  end

  def ngram_matches(ngrams, search_words)
    ngrams.select { |gram| gram[0..search_words.count-1] == search_words }
  end

  def choose_word(matches)
    possible_choices(matches).sample
  end

  def possible_choices(matches)
    matches.map { |res| res.last }.sort
  end
end
