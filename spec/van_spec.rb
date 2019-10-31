# frozen_string_literal: true

require 'van'

describe Van do
  describe '#scooters' do
    it { is_expected.to respond_to :scooters }
    it 'starts as an empty array' do
      expect(subject.scooters).to match_array([])
    end
  end

  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }

    it 'adds scooters to array' do
      loaded_scooters = [double(:scooter)]
      subject.load(loaded_scooters)
      expect(subject.scooters).to match_array(loaded_scooters)
    end
  end

  describe '#deliver' do
    it { is_expected.to respond_to(:deliver) }
    it 'unloads scooters from array' do
      loaded_scooters = [double(:scooter)]
      subject.load(loaded_scooters)
      delivered = subject.deliver
      expect(subject.scooters).to match_array([])
      expect(delivered).to match_array(loaded_scooters)
    end
  end
end
