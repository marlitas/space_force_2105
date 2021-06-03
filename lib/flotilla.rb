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
        requirement.any? do |specialty, experience|
          person.specialties.include?(specialty) && (person.experience >= experience)
        end
      end
    end.uniq
  end

  def personnel_by_ship
    sorted_personnel = {}
    @ships.each do |ship|
        sorted_personnel[ship] = self.recommend_personnel(ship)
    end
    sorted_personnel
  end

  def fully_staffed?(ship)
    answer = false
    self.personnel_by_ship[ship].each do |person|
      ship.requirements.each do |requirement|
        answer = requirement.all? do |specialty, experience|
          person.specialties.include?(specialty)
        end
      end
    end
    answer
  end

  def ready_ships(fuel)
    @ships.find_all do |ship|
      self.fully_staffed?(ship) && (fuel >= 100)
    end
  end
end
