# frozen_string_literal: true

require 'load_module'

class LoadModuleClass
  include LoadModule
end

describe LoadModuleClass do
  describe '#load' do
    it { is_expected.to respond_to(:load).with(1).argument }

    it 'adds scooters to the array' do
      loaded_scooters = [double(:scooter)]
      subject.load(loaded_scooters)
      expect(subject.scooters).to match_array(loaded_scooters)
    end
  end
end
