class Guillaume::Poem
  attr_accessor :corpora, :lines, :poem

  def initialize(corpora, seed = nil)
    @corpora = corpora
    @first_seed = seed.nil? ? random_seed(@corpora.unigrams) : seed
    @poem = write
  end

  def random_seed(ngrams)
    ngrams.select { |word| word.first[0] =~ /[A-Z]/ }.sample.first
  end

  def write(lines_memo = [])
    if rand(100) <= lines_memo.count # never more than 100 lines this way
      return lines_memo
    else
      lines_memo += stanza
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
