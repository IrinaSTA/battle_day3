require 'game'
require 'pry'

describe Game do

  subject(:jack) { double :player1, :name => "jack", :score => 60 }
  subject(:jill) { double :player2, :name => "jill", :score => 60 }
  let(:game) { Game.new(jack, jill) }

  it 'can be started with two players' do
    expect(game).to be_an_instance_of(Game)
  end

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq jack
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq jill
    end
  end

  describe '#attack' do
    it 'inflicts damage on a player' do
      expect(jill).to receive(:receive_damage)
      game.attack(jill)
    end
  end

  describe '#current_turn' do
    it 'starts as player1' do
      expect(game.active_player).to eq(jack)
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.active_player).to eq(jill)
    end
  end

end
