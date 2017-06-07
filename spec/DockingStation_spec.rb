require 'DockingStation.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'gets a bike' do
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

end
