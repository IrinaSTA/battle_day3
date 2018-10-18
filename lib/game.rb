class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def damage_points
    @damage = 10
  end

  def attack(player)
    player.receive_damage(damage_points)
  end

end
