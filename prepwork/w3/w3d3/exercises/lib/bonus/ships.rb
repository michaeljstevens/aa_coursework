class Ships
  SHIPS = {
    "Aircraft carrier" => 5,
    "Battleship" => 4,
    "Submarine" => 3,
    "Destroyer" => 3,
    "Patrol boat" => 2
  }

  attr_accessor :ships

  def initialize
    @ships = SHIPS
  end

end
