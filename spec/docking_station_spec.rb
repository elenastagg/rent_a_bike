# frozen_string_literal: true

require 'docking_station'
# require 'scooter'

describe DockingStation do
  describe '#initilize' do
    it 'has a default capacity' do
      expect(subject.capacity).to equal DockingStation::DEFAULT_CAPACITY
    end

    it 'enables the user to set capacity' do
      docking_station = DockingStation.new(30)
      expect(docking_station.capacity).to equal(30)
    end
  end

  describe '#release_scooter' do
    it { is_expected.to respond_to :release_scooter }

    it 'throws an error when there are no scooters available' do
      expect { subject.release_scooter }.to raise_error(
        'There are no scooters available.'
      )
    end

    it 'releases working scooters' do
      scooter1 = double(:scooter, working?: false)

      scooter2 = double(:scooter, working?: true)

      subject.dock(scooter1)
      subject.dock(scooter2)

      released_scooter = subject.release_scooter

      expect(released_scooter).to be(scooter2)
      expect(subject.scooters.length).to equal(1)
    end

    it 'throws an error when trying to relase a broken scooter' do
      scooter = double(:scooter, working?: false)
      subject.dock(scooter)

      expect { subject.release_scooter }.to raise_error('There are no working scooters available')
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a scooter and adds it to the scooters array' do
      scooter = double :scooter

      subject.dock(scooter)

      expect(subject.scooters).to match_array([scooter])
    end

    it 'throws an error when docking at a full station' do
      subject.capacity.times { subject.dock double :scooter }

      expect { subject.dock double :scooter }.to raise_error(
        'The docking station is full.'
      )
    end
  end

  describe '#scooters' do
    it { is_expected.to respond_to(:scooters) }

    it 'is an empty array by default' do
      expect(subject.scooters).to be_an_instance_of(Array)
      expect(subject.scooters).to match_array([])
    end
  end
end
