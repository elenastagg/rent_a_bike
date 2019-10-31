# frozen_string_literal: true

# Garage
class Garage
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def load(scooters)
    @scooters.concat scooters
  end

  def fix_scooters
    @scooters.each(&:fix)
  end
end
