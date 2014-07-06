describe Guillaume::Poem do
  before(:each) do
    srand(666) # Use of srand allows the testing of otherwise random results
  end

  let(:source_text) { Guillaume::SourceText.new("spec/data/an_occurrence_at_owl_creek_bridge.txt") }

  context "write method" do
    it "should write a poem" do
      poem = Guillaume::Poem.new(source_text)
      expect(poem.formatted).to eq("He sure were spectators--a company the formed straight on side \nside full of stream, the had him.\nExcepting group four the of death\n")
    end
  end

  it "should use a seed" do
    poem = Guillaume::Poem.new(source_text, seed: "They")
    expect(poem.formatted[0..3]).to eq("They")
  end

  context "stanza method" do
    it "should write a single stanza" do
      stanza = Guillaume::Poem.new(source_text).stanza
      expect(stanza).to eq(
        ["No; I cannot dodge them all!\" An appalling splash within two men to side in a sound like tinder.\" The intervals of the \nhands crossed upon which had not be the work of that is darkness and something uncanny in his fingers into their branches in the Owl Creek bridge, staring stonily, motionless.", "The man's brain was a few moments he was \na civilian, if consistent with his own home.", "The liberal military code makes provision for the men--with what he replied.", "They his in morning's", ""]
      )
    end
  end
end
