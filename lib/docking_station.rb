# frozen_string_literal: true

require_relative './scooter'

# DockingStation
class DockingStation
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def release_scooter
    raise 'There are no scooters available.' if @scooters.length.zero?

    @scooters.shift
  end

  def dock(scooter)
    @scooters.push(scooter)
  end
end
