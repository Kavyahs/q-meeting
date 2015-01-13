require 'rails_helper'

RSpec.describe Booking, :type => :model do
  let(:booking) {FactoryGirl.create(:booking)}

  it "should validate the booking factory" do
    expect(FactoryGirl.build(:booking).valid?).to be true
  end

  it { should validate_presence_of :title }
  it { should allow_value('Testing title for booking').for(:title)}
  it { should belong_to(:user) }
  it { should belong_to(:venue) }

  it "should search the booking" do
    Booking.create(:title =>"Booking 1", :description =>"Apples");
    Booking.create(:title =>"Booking 2", :description =>"Mangoes");
    expect(Booking.search("Booking 1")).to be_truthy
    expect(Booking.search("Booking 2")).to be_truthy
    expect(Booking.search("Booking")).to be_truthy
    expect(Booking.search("Apples")).to be_truthy
    expect(Booking.search("Mangoes")).to be_truthy
    expect(Booking.search("No Data")).to be_empty
  end
end
