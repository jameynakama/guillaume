class Guillaume::Poem
  attr_accessor :corpus, :poem

  def initialize(corpus, options = { seed: nil, max_stanzas: "10" })
    @corpus = corpus
    @first_seed = options[:seed].nil? ? random_seed(@corpus.unigrams.as_array) : options[:seed]
    @max_stanzas = options[:max_stanzas].to_i
    @stanzas = 0
    @poem = write
  end

  def get_seed(lines)
    if @stanzas == 0 && lines.empty?
      @first_seed
    else
      random_seed @corpus.unigrams.as_array
    end
  end

  def random_seed(ngrams)
    ngrams.select { |word| word.first[0] =~ /[A-Z]/ }.sample.first
  end

  def write(lines_memo = [])
    if rand(@max_stanzas) < @stanzas
      return lines_memo
    else
      lines_memo += stanza
      @stanzas += 1
      write(lines_memo)
    end
  end

  #
  # TODO: which_gram
  # TODO: explicit num_lines option
  #
  def stanza(lines_memo = [])
    if rand(1..10) <= lines_memo.count # never more than 10 lines this way
      return lines_memo << ""
    else
      # TODO: move this to poetics (and do mid-line rarely)
      ngrams = WeightedRandomizer.new({
        @corpus.bigrams.as_array => 3,
        @corpus.trigrams.as_array => 3,
        @corpus.tetragrams.as_array => 2
      }).sample
      line = Guillaume::Line.new(get_seed lines_memo).build(ngrams, @corpus)
      if line.length > 80
        line = Guillaume::Poetics.enjamb line, 40 # 40% chance to break a long line
      end
      lines_memo << line
      stanza(lines_memo)
    end
  end

  def formatted
    @formatted ||= @poem.join("\n")
  end
end

