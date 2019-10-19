require 'docking_station'
require 'scooter'

describe DockingStation do
  describe "#release_scooter" do
    it { is_expected.to respond_to :release_scooter }

    it 'releases working scooters' do
      scooter = subject.release_scooter
      expect(scooter).to be_an_instance_of(Scooter)
      expect(scooter).to be_working
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'docks a scooter and adds it to the scooters array' do
      scooter = Scooter.new
      subject.dock(scooter)
      expect(subject.scooters).to match_array [scooter]
    end
  end

  describe "#scooters" do
    it { is_expected.to respond_to(:scooters) }

    it "is an empty array by default" do
      expect(subject.scooters).to be_an_instance_of(Array)
      expect(subject.scooters).to match_array []
    end
  end
end
