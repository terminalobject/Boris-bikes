require 'DockingStation.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  # Check when the class is first created
  describe "Docking Station capacity" do
    it "Has a Capacity of 20 by default" do
      station = DockingStation.new
      expect(station.capacity).to eq 20
    end

    it "Has a capacity of a certain number when specified" do
      number_of_docks = rand(1..200)
      station = DockingStation.new(number_of_docks)
      expect(station.capacity).to eq number_of_docks
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("There are no more bikes available")
    end

    it 'gets a bike' do
      subject.dock(Bike.new)
      bike = subject.release_bike
        expect(bike).to be_a_kind_of(Bike)
        expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect{subject.dock Bike.new}.to raise_error("The docking station is full")
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end

  describe '#report_broken_bike' do

    it { is_expected.to respond_to(:report_broken_bike) }

    it "changes a bike's status to broken" do
      bike = Bike.new
      subject.report_broken_bike(bike)
      expect(bike).to_not be_working
    end
  end

  # describe '#full?' do
  #   it "tells if the docking station is full" do

  #     20.times { subject.dock(Bike.new) }
  #     expect(subject).to be_full

  #     20.times { subject.release_bike }
  #     expect(subject).to_not be_full
  #   end
  # end

  # describe '#empty?' do
  #   it "tells if the docking station is empty" do
  #     5.times { subject.dock(Bike.new) }
  #     expect(subject).to_not be_empty

  #     5.times { subject.release_bike }
  #     expect(subject).to be_empty
  #   end
  # end
end
