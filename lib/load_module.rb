# LoadModule
module LoadModule
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def load(scooters)
    @scooters.concat scooters
  end
end

