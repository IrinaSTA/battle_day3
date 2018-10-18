require 'player'

describe Player do

  subject(:jack) {Player.new("Jack")}
  subject(:jill) {Player.new("Jill")}

  it 'has a name' do
    expect(jack.name).to eq("Jack")
  end

  it 'returns score' do
    expect(jack.score).to eq 60
  end

  it 'receives damage' do
    jack.receive_damage
    expect(jack.score).to eq(50)
  end

end
