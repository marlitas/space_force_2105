class Spacecraft
  attr_reader :name, :fuel
  def initialize (stats)
    @name = stats[:name]
    @fuel = stats[:fuel]
  end
end
