require 'rails_helper'

RSpec.describe Venue, :type => :model do
  let(:venue) {FactoryGirl.create(:venue)}

  it "should validate the venue factory" do
    expect(FactoryGirl.build(:venue).valid?).to be true
  end

  it { should validate_presence_of :name }
  it { should allow_value('Testing name for venue').for(:name)}
  it { should have_many(:bookings) }

  it "should search the venue" do
    Venue.create(:name =>"Venue 1");
    Venue.create(:name =>"Venue 2");
    expect(Venue.search("Venue 1")).to be_truthy
    expect(Venue.search("Venue 2")).to be_truthy
    expect(Venue.search("Venue")).to be_truthy
  end
end