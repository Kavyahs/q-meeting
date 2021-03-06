require 'rails_helper'

RSpec.describe User, :type => :model do

  context "Factory settings for users" do
    it "should validate all the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
      expect(FactoryGirl.build(:admin_user).valid?).to be true
      expect(FactoryGirl.build(:super_admin_user).valid?).to be true
    end
  end
end