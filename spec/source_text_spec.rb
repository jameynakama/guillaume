describe Guillaume::SourceText do
  subject do
    source_text = FactoryGirl.create :source_text
    source_text.record_ngrams
    source_text
  end

  it "should normalize the input file" do
    expect(subject.normalized).to eq("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc scelerisque quis nunc a tincidunt. Donec sed nibh ultricies, consequat ante in, fermentum ligula.")
  end

  it "should have unigrams" do
    expect(subject.unigrams.map { |ng| ng.ngram }).to eq(["Lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", "adipiscing", "elit.", "Nunc", "scelerisque", "quis", "nunc", "a", "tincidunt.", "Donec", "sed", "nibh", "ultricies,", "consequat", "ante", "in,", "fermentum", "ligula."])
  end

  it "should have bigrams" do
    expect(subject.bigrams.map { |ng| ng.ngram }).to eq(["Lorem||ipsum", "ipsum||dolor", "dolor||sit", "sit||amet,", "amet,||consectetur", "consectetur||adipiscing", "adipiscing||elit.", "Nunc||scelerisque", "scelerisque||quis", "quis||nunc", "nunc||a", "a||tincidunt.", "Donec||sed", "sed||nibh", "nibh||ultricies,", "ultricies,||consequat", "consequat||ante", "ante||in,", "in,||fermentum", "fermentum||ligula."])
  end

  it "should have trigrams" do
    expect(subject.trigrams.map { |ng| ng.ngram }).to eq(["Lorem||ipsum||dolor", "ipsum||dolor||sit", "dolor||sit||amet,", "sit||amet,||consectetur", "amet,||consectetur||adipiscing", "consectetur||adipiscing||elit.", "Nunc||scelerisque||quis", "scelerisque||quis||nunc", "quis||nunc||a", "nunc||a||tincidunt.", "Donec||sed||nibh", "sed||nibh||ultricies,", "nibh||ultricies,||consequat", "ultricies,||consequat||ante", "consequat||ante||in,", "ante||in,||fermentum", "in,||fermentum||ligula."])
  end

  it "should have tetragrams" do
    expect(subject.tetragrams.map { |ng| ng.ngram }).to eq(["Lorem||ipsum||dolor||sit", "ipsum||dolor||sit||amet,", "dolor||sit||amet,||consectetur", "sit||amet,||consectetur||adipiscing", "amet,||consectetur||adipiscing||elit.", "Nunc||scelerisque||quis||nunc", "scelerisque||quis||nunc||a", "quis||nunc||a||tincidunt.", "Donec||sed||nibh||ultricies,", "sed||nibh||ultricies,||consequat", "nibh||ultricies,||consequat||ante", "ultricies,||consequat||ante||in,", "consequat||ante||in,||fermentum", "ante||in,||fermentum||ligula."])
  end
end
