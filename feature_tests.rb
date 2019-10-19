# frozen_string_literal: true

require './lib/scooter'
require './lib/docking_station'

# ---------
# Docking Scooters
# ---------

# scooter = Scooter.new
# docking_station = DockingStation.new

# p scooter

# p docking_station.scooters

# docking_station.dock(scooter)

# p docking_station.scooters

# ---------
# Error when trying to release scooters from an empty station
# ---------

# docking_station = DockingStation.new

# docking_station.release_scooter

# puts 'An error should have been thrown and we shouldn\'t see this message'

# ---------
# Releases a scooter when some are docked
# ---------

# docking_station = DockingStation.new
# scooter = Scooter.new

# docking_station.dock(scooter)

# released_scooter = docking_station.release_scooter

# puts 'Released scooter is the stored scooter'
# p released_scooter == scooter

# puts 'Station contains no scooters'
# p docking_station.scooters.length.zero?

# ---------
# Can't dock scooter at full station - has capacity of one
# ---------

# docking_station = DockingStation.new

# docking_station.dock(Scooter.new)
# docking_station.dock(Scooter.new)

# puts 'An error should have been thrown and we shouldn\'t see this message'

# ---------
#
# ---------
