# frozen_string_literal: true

require_relative './scooter'

# DockingStation
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :scooters
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @scooters = []
    @capacity = capacity
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
    @scooters.length >= @capacity
  end
end
