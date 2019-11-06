# frozen_string_literal: true

require 'load_module'

# Van
class Van
  include LoadModule

  def deliver
    scooters = @scooters
    @scooters = []
    scooters
  end
end
