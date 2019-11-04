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

  def release_scooters
    raise 'There are no working scooters' if @scooters.none?(&:working?)

    working_scooters = @scooters.filter(&:working?)
    @scooters.delete_if(&:working?)
    working_scooters
  end
end
