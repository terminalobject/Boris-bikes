require 'Bike'

describe Bike do

  describe "Initialization" do
    it "Makes working bikes" do
      expect(subject.status).to eq "working"
    end
  end

  it { is_expected.to respond_to(:working?) }

  describe "#working?" do
    it "returns true when bike is working" do
      bike = Bike.new
      expect(bike).to be_working
    end

    it "returns false when bike is broken" do
      bike = Bike.new
      bike.break
      expect(bike).to_not be_working
    end
  end

  describe "#break" do
    it "Changes a bike's status to broken" do
      subject.break
      expect(subject.status).to eq "broken"
    end
  end
end
