# frozen_string_literal: true

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
    raise 'There are no working scooters available' if @scooters.none?(&:working?)

    @scooters.delete_at(@scooters.index(&:working?))
  end

  def release_broken
    broken_scooters = @scooters.reject(&:working?)
    @scooters.delete_if { |scooter| !scooter.working? }
    broken_scooters
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
