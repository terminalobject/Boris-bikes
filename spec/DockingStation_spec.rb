require 'DockingStation.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

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
      20.times { subject.dock(Bike.new) }
      expect{subject.dock Bike.new}.to raise_error("The docking station is full")
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes.last
    end
  end

  describe '#full?' do
    it "tells if the docking station is full" do
      if subject.bikes.count >= 20
        expect(subject.full?).to eq true
      else 
        expect(subject.full?).to eq false 
      end 
    end 
  end

  describe '#empty?' do
    it "tells if the docking station is empty" do 
      if subject.bikes.count >= 20
        expect(subject.empty?).to eq false
      else 
        expect(subject.empty?).to eq true
      end 
    end 
  end 
end
