class Player

  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 60
  end

  def receive_damage
    @score -= 10
  end

end
