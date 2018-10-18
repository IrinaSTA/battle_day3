require 'game'
require 'pry'

describe Game do

  subject(:imogen) { double :player1, :name => "imogen", :score => 60 }
  subject(:irina) { double :player2, :name => "irina", :score => 60 }
  let(:game) { Game.new(imogen, irina) }

  it 'can be started with two players' do
    expect(game).to be_an_instance_of(Game)
  end

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq imogen
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq irina
    end
  end

  describe '#attack' do
    it 'inflicts damage on a player' do
      expect(irina).to receive(:receive_damage)
      game.attack(irina)
    end
  end

  describe '#current_turn' do
    it 'starts as player1' do
      expect(game.current_turn).to eq(imogen)
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq(irina)
    end
  end

end
