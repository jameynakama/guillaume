describe Guillaume::Corpus do
  before(:all) do
    @source_text_1 = FactoryGirl.create :source_text, file_name: "spec/data/john_ashbury_1.txt"
    @source_text_1.record_ngrams
    @source_text_2 = FactoryGirl.create :source_text, file_name: "spec/data/john_ashbury_2.txt"
    @source_text_2.record_ngrams
  end

  before(:each) do
    Guillaume::Corpus.destroy_all
  end

  subject do
    corpus = FactoryGirl.create :corpus
  end

  it "should be able to add a source text" do
    subject.source_texts << @source_text_1
    expect(Guillaume::Corpus.first.source_texts.count).to eq(1)
    expect(subject.source_texts.first).to eq(@source_text_1)
  end

  it "should be able to add many source texts" do
    subject.source_texts << @source_text_1
    subject.source_texts << @source_text_2
    expect(Guillaume::Corpus.first.source_texts.count).to eq(2)
  end
end
