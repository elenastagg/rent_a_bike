# frozen_string_literal: true

# Van
class Van
  attr_reader :scooters

  def initialize
    @scooters = []
  end

  def load(scooters)
    @scooters.concat scooters
  end

  def deliver
    scooters = @scooters
    @scooters = []
    scooters
  end
end
