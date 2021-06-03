class Spacecraft
  attr_reader :name, :fuel, :requirements
  def initialize (stats)
    @name = stats[:name]
    @fuel = stats[:fuel]
    @requirements = []
  end

  def add_requirement(requirement)
    @requirements << requirement
  end
end
