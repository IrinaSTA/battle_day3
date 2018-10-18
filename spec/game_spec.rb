require 'game'
require 'pry'

describe Game do

  subject(:imogen) { double :player1, :name => "imogen", :score => 60 }
  subject(:irina) { double :player2, :name => "irina", :score => 60 }
  let(:game) { Game.new(imogen, irina) }

  it 'can be started with two players' do
    expect(game).to be_an_instance_of(Game)
  end

  it 'can attack a player' do
    expect(irina).to receive(:receive_damage)
    game.attack(irina)
  end

end
