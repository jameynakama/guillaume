describe Guillaume::Line do
  before(:all) do
    srand(999) # Use of srand allows the testing of otherwise random results
    @source_text = FactoryGirl.create :source_text, file_name: "spec/data/john_ashbury.txt"
    @source_text.record_ngrams
    @bigrams = @source_text.bigrams.as_array
    @trigrams = @source_text.trigrams.as_array
  end

  subject :line do
    Guillaume::Line.new("The")
  end

  it "should build a new line" do
    expect(line.build(@bigrams)).to eq("The Double Dream of his goal was 15 Ashbery was welcomed with form appears.")
  end

  it "should find matches from ngrams" do
    expect(line.ngram_matches(@trigrams, %w(He))).to eq(
      [
        ["He", "has", "published"],
        ["He", "was", "raised"],
        ["He", "also", "published"],
        ["He", "wrote", "his"],
        ["He", "was", "an"],
        ["He", "had", "previously"],
        ["He", "became", "close"],
        ["He", "was", "elected"],
        ["He", "was", "the"],
        ["He", "serves", "on"],
        ["He", "was", "a"],
        ["He", "has", "written"]
      ]
    )
  end

  it "should choose the next word" do
    expect(line.next_word(@bigrams)).to eq("play")
  end
end
