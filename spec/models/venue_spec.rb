require 'rails_helper'

RSpec.describe Venue, :type => :model do

  context "Factory settings for venues" do
    it "should validate all the venue factories" do
      expect(FactoryGirl.build(:venue).valid?).to be true
    end
  end
end