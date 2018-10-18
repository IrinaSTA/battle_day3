class Game

  attr_reader :active_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @active_player = player1
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def switch_turns
    @active_player = opponent_of(active_player)
  end

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

  def attack(player)
    player.receive_damage
  end

  def passive_player
    opponent_of(active_player)
  end

end
