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

let(:bike) {double :bike}

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("There are no more bikes available")
    end
    it 'does not release a broken bike' do
        allow(bike).to receive(:working?).and_return(false)
        allow(bike).to receive(:break)
        allow(bike).to receive(:status).and_return("broken")
        allow(bike).to receive(:report_broken_bike)
 #Double here
        subject.report_broken_bike(bike)
        expect{subject.release_bike}.to raise_error("This bike is broken")
    end 

    it 'gets a bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike) #Double here
      bike = subject.release_bike
        expect(bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) } #Double here
      expect{subject.dock double(:bike)}.to raise_error("The docking station is full") #and here
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = double(:bike) #Double here
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end

  describe '#report_broken_bike' do

    it { is_expected.to respond_to(:report_broken_bike) }

    it "changes a bike's status to broken" do
      allow(bike).to receive(:break) #Double here
      allow(bike).to receive(:working?).and_return(false)
      subject.report_broken_bike(bike)
      expect(bike).to_not be_working
    end
  end

  # describe '#full?' do
  #   it "tells if the docking station is full" do

  #     20.times { subject.dock(double(:bike)) }
  #     expect(subject).to be_full

  #     20.times { subject.release_bike }
  #     expect(subject).to_not be_full
  #   end
  # end

  # describe '#empty?' do
  #   it "tells if the docking station is empty" do
  #     5.times { subject.dock(double(:bike)) }
  #     expect(subject).to_not be_empty

  #     5.times { subject.release_bike }
  #     expect(subject).to be_empty
  #   end
  # end
end


