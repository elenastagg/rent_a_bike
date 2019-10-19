# frozen_string_literal: true

require_relative './scooter'

# DockingStation
class DockingStation
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def release_scooter
    raise 'There are no scooters available.' if empty?

    @scooters.shift
  end

  def dock(scooter)
    raise 'The docking station is full.' if full?

    @scooters.push(scooter)
  end

  private

  def empty?
    @scooters.length.zero?
  end

  def full?
    @scooters.length == 1
  end
end
