require_relative './scooter'

class DockingStation
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def release_scooter
    Scooter.new
  end

  def dock(scooter)
    @scooters.push(scooter)
  end
end
