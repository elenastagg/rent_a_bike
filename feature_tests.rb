# frozen_string_literal: true

require './lib/scooter'
require './lib/docking_station'
require './lib/garage'
require './lib/van'

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

# docking_station = DockingStation.new
# scooter1 = Scooter.new
# scooter2 = Scooter.new

# scooter1.report_broken
# puts 'scooter one is working? - false'
# p scooter1.working?
# docking_station.dock(scooter1)
# docking_station.dock(scooter2)

# released = docking_station.release_scooter

# puts 'Release a working bike'
# p released.working?

# docking_station.release_scooter

# puts 'An error should have been thrown'

# ---------
# Remove broken scooters & deliver
# ---------

# docking_station = DockingStation.new
# scooter = Scooter.new
# scooter2 = Scooter.new

# van = Van.new

# scooter.report_broken

# docking_station.dock(scooter)
# docking_station.dock(scooter2)

# broken_scooters = docking_station.release_broken

# puts docking_station.scooters == [scooter2]
# puts broken_scooters == [scooter]

# puts van.scooters == []

# loaded_scooters = broken_scooters

# van.load(loaded_scooters)

# puts van.scooters == loaded_scooters

# delivered_scooters = van.deliver

# puts van.scooters == []
# puts delivered_scooters == loaded_scooters

# ---------
# Receive and fix scooters in garage
# ---------
garage = Garage.new
van = Van.new
docking_station = DockingStation.new
scooter = Scooter.new

scooter.report_broken
docking_station.dock(scooter)
loaded_scooters = docking_station.release_broken
van.load(loaded_scooters)
van.deliver
garage.load(loaded_scooters)
garage.scooters == loaded_scooters
puts 'garage should now have broken scooters'
p garage.scooters
garage.fix_scooters
puts 'scooter working? should be true:'
p garage.scooters(&:working?)

# ---------
# Collect working scooters
# ---------

# garage = Garage.new
# van = Van.new
# scooter = Scooter.new
# docking_station = DockingStation.new

# docking_station.dock(scooter)
# loaded_scooters = docking_station.release_broken
# van.load(loaded_scooters)
# van.deliver
# garage.load(loaded_scooters)
# garage.scooters == loaded_scooters
# scooter.fix
# p scooter.working?
# garage.release(scooter)
# van.load(scooter)
# van.deliver
# p van.scooters
# docking_station.dock(scooter)
# p docking_station

# # ---------
# # Distribute to docking stations
# # ---------
