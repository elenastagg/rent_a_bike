# frozen_string_literal: true

require 'garage'

describe Garage do
  describe '#scooters' do
    it { is_expected.to respond_to :scooters }
    it 'starts as an empty array' do
      expect(subject.scooters).to match_array([])
    end
  end

  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }

    it 'adds the broken scooters to the array' do
      broken_scooters = [double(:scooter)]
      subject.load(broken_scooters)
      expect(subject.scooters).to match_array(broken_scooters)
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
end
