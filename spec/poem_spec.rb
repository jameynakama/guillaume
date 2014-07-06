describe Guillaume::Poem do
  before(:each) do
    srand(666) # Use of srand allows the testing of otherwise random results
  end

  let(:source_text) { Guillaume::SourceText.new("spec/data/an_occurrence_at_owl_creek_bridge.txt") }

  context "write method" do
    it "should write a poem" do
      poem = Guillaume::Poem.new(source_text)
      expect(poem.formatted).to eq("He sure they were unarmed.\nFarquhar was being on the racing madly his back, it Owl Creek bridge, \ncaptain, saluted and he think of noose about thirty-five of an hand resting forearm straight on the back the bridge, put it comes to be shot.\n")
    end
  end

  it "should use a seed" do
    poem = Guillaume::Poem.new(source_text, seed: "They")
    expect(poem.formatted).to eq("They it with the stream, the had come.\nDoubtless was swimming reach the bound a the forests, the Owl Creek bridge, \na great of the command at with quick, downward through the thought the roadway his subordinates, but did resemble.\n")
  end

  context "stanza method" do
    it "should write a single stanza" do
      stanza = Guillaume::Poem.new(source_text).stanza
      expect(stanza).to eq(
        ["Ambrose Bierce man and until retaken.", "Farquhar dead; with her bowed to it warm and the sun, the his neck.", "Creek bridge, captain, saluted and wrenched an officer in growing light.", "This plank upon his own the shoulder, the privates, executioners.", ""]
      )
    end
  end
end
