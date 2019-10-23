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
# Can't dock scooter at full station - has default capacity of twenty
# ---------

# docking_station = DockingStation.new

# p docking_station.capacity == 20

# 20.times { docking_station.dock(Scooter.new) }

# puts 'Docked 20 scooters'

# docking_station.dock(Scooter.new)

# puts 'An error should have been thrown and we shouldn\'t see this message'

# ---------
# Allows user to set a capacity
# ---------

# docking_station = DockingStation.new(30)

# p docking_station.capacity == 30

# 30.times { docking_station.dock(Scooter.new) }

# puts 'Docked 30 scooters'

# docking_station.dock(Scooter.new)

# puts 'An error should have been thrown and we shouldn\'t see this message'

# ---------
# Allows member of the public to report a broken bike on returning
# ---------

docking_station = DockingStation.new
scooter1 = Scooter.new
scooter2 = Scooter.new

scooter1.report_broken
puts 'scooter one is working? - false'
p scooter1.working?
docking_station.dock(scooter1)
docking_station.dock(scooter2)

released = docking_station.release_scooter

puts 'Release a working bike'
p released.working?

docking_station.release_scooter

puts 'An error should have been thrown'

# ---------

# ---------