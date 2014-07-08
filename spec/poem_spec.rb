describe Guillaume::Poem do
  before(:all) do
    srand(666) # Use of srand allows the testing of otherwise random results
    @source_text = FactoryGirl.create :source_text, file_name: "spec/data/john_ashbury.txt"
    @source_text.record_ngrams
  end

  context "write method" do
    it "should write a poem" do
      poem = Guillaume::Poem.new(@source_text)
      expect(poem.formatted).to eq("As We Know, which was born in 1949 with Andy Warhol at many years later, he has Arthur Rimbaud (Illuminations), Max Jacob (The Dice Cup), Pierre Martory, whose poetry defies even the contributing editorial board \nof Languages and the Tibor de Nagy Gallery, categorized the poet John Lawrence Ashbery has continued to be accessible to Buffalo in Wesleyan's Distinguished Writers Series.\nBrooklyn College, where he had previously written in a much more than twenty volumes of Harry Mathews' Locus \nSolus (# 3/4; 1962).\nWallace Boris and in describing visit Paris \"the figure half incomprehensible\".\nAlthough has again the experimentation The is subject a student, a figure so \nin 20s 30s several three American over editor.\nTo make ends meet he was published in 2008.\n\nEnglish, Ashbery New his are long awards the Ashbery 2007 W.H.\n\nSkaters\" and Dylan Thomas, and Literature (1964–67) and insistent wit remain consistent elements of Kenneth Koch, Barbara Guest,\n Kenward Elmslie and a farmer.\nPound.\" Burt, poet Malanga, assistant, whom had a teacher, \nChester Ashbery, farmer.\nH.\nNew York to be accessible to 2003, and Ashbery has been collected in \na copywriter in 2000.\nYork to Buffalo in Rochester.\n\nAshbery,\" Langdon Hammer, chairman of The collection's title \npoem \"Litany.\" By the subject of W.\nAmerica's most controversial).\nSelected Prose and Rivers and Literature (1964–67) and The Landscapist he continued to be a Fellow at the mid-1950s, when Thomas Hess took over the 1980s, \nhe was a piece of the human mind is an obscure avant-garde experimentalist into one of Art Chronicles 1957-1987, edited by the Deerfield Scroll.\nWarhol's on poetry W.\nV.\n")
    end
  end

  it "should use a seed" do
    poem = Guillaume::Poem.new(@source_text, seed: "They")
    expect(poem.formatted[0..3]).to eq("They")
  end

  context "stanza method" do
    it "should write a single stanza" do
      stanza = Guillaume::Poem.new(@source_text).stanza
      expect(stanza).to eq(
        ["Award).", "Buffalo in New York State from the National Book Award and Sciences in 1956.", "Epstein, V.", "City and many people as \"a harebrained, homegrown surrealist whose poetry volume Reported Sightings, Art \nChronicles 1957-1987, edited by The Double Dream of conventional poetic literature.", ""]
      )
    end
  end
end
