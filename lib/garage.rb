# frozen_string_literal: true

require 'load_module'

# Garage
class Garage
  include LoadModule

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
