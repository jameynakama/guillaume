require "weighted_randomizer"

class Guillaume::Line
  def initialize(seed)
    @line_parts = seed.split(/ /)
  end

  def build(ngrams)
    begin
      @line_parts << next_word(ngrams)
    end until @line_parts.last.nil?
    @line_parts.join(" ").strip
  end

  def next_word(ngrams, options = { look_behind: 1 })
    look_behind = options[:look_behind]
    search_words = @line_parts[-options[:look_behind]..-1]
    next_words = choose_words(ngram_matches(ngrams, search_words), look_behind)
    puts ". . . #{next_words} . . ."
    return next_words
  end

  def ngram_matches(ngrams, search_words)
    ngrams.select { |gram| gram[0..search_words.count-1] == search_words }
  end

  #
  # Returns the next words as a string from a list of ngram matches
  # e.g., [%w(know the white whale), %(know the black ship)] matching on
  #       [%w(know the)] will return either "white whale" or "black ship"
  # TODO: sort by match frequency, so Poetics can choose to pick a common or
  #       surprising next string of words
  #
  def choose_words(matches, look_behind)
    matches.map do |match|
      match[look_behind..-1].join(" ").strip
    end.sample
  end
end
