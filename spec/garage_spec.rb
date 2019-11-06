# frozen_string_literal: true

require 'garage'

describe Garage do
  describe '#scooters' do
    it { is_expected.to respond_to :scooters }
    it 'starts as an empty array' do
      expect(subject.scooters).to match_array([])
    end
  end

  describe '#fix_scooters' do
    it { is_expected.to respond_to :fix_scooters }

    it 'calls the fix method on all scooters' do
      scooter1 = double(:scooter)
      allow(scooter1).to receive(:fix)
      scooter2 = double(:scooter)
      allow(scooter2).to receive(:fix)
      broken_scooters = [scooter1, scooter2]
      subject.load(broken_scooters)

      subject.fix_scooters

      expect(scooter1).to have_received(:fix)
      expect(scooter2).to have_received(:fix)
    end
  end

  describe '#release_scooters' do
    it { is_expected.to respond_to :release_scooters }

    it 'deletes working scooters from the array' do
      scooter = double(:scooter, working?: true)
      scooter1 = double(:scooter, working?: false)
      all_scooters = [scooter, scooter1]
      subject.load(all_scooters)
      released_scooter = subject.release_scooters
      expect(released_scooter).to match_array([scooter])
    end

    it 'raises an error if there is no working scooters to release' do
      scooter = double(scooter, working?: false)
      subject.load([scooter])
      expect { subject.release_scooters }.to raise_error(
        'There are no working scooters'
      )
    end
  end
end
