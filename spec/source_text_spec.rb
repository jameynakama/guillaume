describe Guillaume::SourceText do
  let(:file_path) { "spec/data/zone.txt" }

  subject do
    Guillaume::SourceText.new(file_path)
  end

  it "should normalize the input file" do
    expect(subject.normalized).to eq("A la fin tu es las de ce monde ancien")
  end

  it "should have unigrams" do
    expect(subject.unigrams).to eq([%w(A), %w(la), %w(fin), %w(tu), %w(es), %w(las), %w(de), %w(ce), %w(monde), %w(ancien)])
  end

  it "should have bigrams" do
    expect(subject.bigrams).to eq([%w(A la), %w(la fin), %w(fin tu), %w(tu es), %w(es las), %w(las de), %w(de ce), %w(ce monde), %w(monde ancien)])
  end

  it "should have trigrams" do
    expect(subject.trigrams).to eq([%w(A la fin), %w(la fin tu), %w(fin tu es), %w(tu es las), %w(es las de), %w(las de ce), %w( de ce monde), %w(ce monde ancien)])
  end

  it "should have tetragrams" do
    expect(subject.tetragrams).to eq([%w(A la fin tu), %w(la fin tu es), %w(fin tu es las), %w(tu es las de), %w(es las de ce), %w(las de ce monde), %w(de ce monde ancien)])
  end
end
