class Guillaume::Poem
  attr_accessor :corpora, :lines, :poem

  def initialize(corpora, options = { seed: nil, max_stanzas: 10 })
    @corpora = corpora
    @first_seed = options[:seed].nil? ? random_seed(@corpora.unigrams) : options[:seed]
    @max_stanzas = options[:max_stanzas]
    @lines = 0
    @stanzas = 0
    @poem = write
  end

  def random_seed(ngrams)
    ngrams.select { |word| word.first[0] =~ /[A-Z]/ }.sample.first
  end

  def write(lines_memo = [])
    if rand(@max_stanzas) < @stanzas
      return lines_memo
    else
      $LOGGER.info("Writing stanza #{@stanzas + 1}...")
      lines_memo += stanza
      @stanzas += 1
      write(lines_memo)
    end
  end

  #
  # TODO: which_gram
  # TODO: thesaurus stuff for topic staying/straying
  # TODO: explicit num_lines option
  #
  def stanza(lines_memo = [])
    #which_gram = :bigrams

    if rand(100) <= lines_memo.count * 10 # never more than 10 lines this way
      return lines_memo << ""
    else
      line = Guillaume::Line.new(random_seed(@corpora.unigrams)).build(@corpora.bigrams)
      if line.length > 80
        line = Guillaume::Poetics.enjamb 40, line # 40% chance to break a long line
      end
      lines_memo << line
      stanza(lines_memo)
    end
  end

  def formatted
    @formatted ||= @poem.join("\n")
  end
end
