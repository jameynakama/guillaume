describe Guillaume::Poetics do
  before :each do
    srand(666)
  end

  it "should do enjambment" do
    line = "To make my eclogues proper, I must sleep hard by heaven--like the astrologers--and being the belfries' neighbor, hear in my dreams their solemn anthems fading on the wind. My garret view, perused attentively, reveals the workshops and their singing slaves, the city's masts--steeples and chimneypots--and above that fleet, a blue eternity..."
    expected = "To make my eclogues proper, I must sleep hard by heaven--like the astrologers--and being the belfries' neighbor, hear in my dreams their solemn anthems fading on the wind. My garret view, perused attentively, reveals the workshops and their singing slaves, the city's masts--steeples and chimneypots--
and above that fleet, a blue eternity..."
    expect(Guillaume::Poetics.enjamb(line)).to eq(expected)
  end
end
