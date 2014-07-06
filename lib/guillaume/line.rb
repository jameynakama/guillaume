require "weighted_randomizer"

class Guillaume::Line
  def initialize(seed)
    @line_parts = seed.split(/ /)
  end

  def build(possible_ngrams)
    begin
      ngram = possible_ngrams.sample
      $LOGGER.debug("    Using #{ngram.first.count}-grams for next word...")
      @line_parts << next_word(ngram)
    end until @line_parts.last.nil?
    @line_parts.join(" ").strip
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
