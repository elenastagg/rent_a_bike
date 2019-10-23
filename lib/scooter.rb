# frozen_string_literal: true

# Scooter
class Scooter
  attr_writer :working
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_broken
    @working = false
  end
end
