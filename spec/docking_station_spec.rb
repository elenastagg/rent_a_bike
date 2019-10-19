# frozen_string_literal: true

require 'docking_station'
require 'scooter'

describe DockingStation do
  describe '#release_scooter' do
    it { is_expected.to respond_to :release_scooter }

    it 'throws an error when there are no scooters available' do
      expect { subject.release_scooter }.to raise_error(
        'There are no scooters available.'
      )
    end

    it 'releases working scooters' do
      scooter = Scooter.new
      subject.dock(scooter)

      released_scooter = subject.release_scooter

      expect(released_scooter).to equal(scooter)
      expect(subject.scooters.length).to be_zero
      expect(released_scooter).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a scooter and adds it to the scooters array' do
      scooter = Scooter.new

      subject.dock(scooter)

      expect(subject.scooters).to match_array([scooter])
    end

    it 'throws an error when docking at a full station' do
      DockingStation::CAPACITY.times { subject.dock(Scooter.new) }

      expect { subject.dock(Scooter.new) }.to raise_error(
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
