class Flotilla
  attr_reader :name, :personnel, :ships
  def initialize(designation)
    @name = designation[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship)
    ship.requirements.flat_map do |requirement|
      @personnel.find_all do |person|
        # require "pry"; binding.pry
        person.specialties.include?(requirement.keys[0]) && (person.experience >= requirement.values[0])
        # require "pry"; binding.pry
      end
    end.uniq
  end
end
