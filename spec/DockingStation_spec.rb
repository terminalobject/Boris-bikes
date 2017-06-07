require 'DockingStation.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'gets a bike' do
    subject.dock(Bike.new)
    bike = subject.release_bike
      expect(bike).to be_a_kind_of(Bike)
      expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns the bike we dock' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect{subject.release_bike}.to raise_error("There are no more bikes available")
    end
  end

  describe '#dock' do
    it 'raises an error when the docking station is full' do
      subject.dock(Bike.new)
      expect{subject.dock Bike.new}.to raise_error("The docking station is full")
    end
  end
end
