require "./lib/scooter"
require "./lib/docking_station"

scooter = Scooter.new
docking_station = DockingStation.new

p scooter

p docking_station.scooters

docking_station.dock(scooter)

p docking_station.scooters