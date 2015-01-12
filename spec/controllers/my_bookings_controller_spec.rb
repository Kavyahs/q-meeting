require "rails_helper"

RSpec.describe User::MyBookingsController, :type => :controller do
  describe "GET my bookings" do
    it "should render the template index" do
     	user = FactoryGirl.create(:user)
      get :index, {}, {id: user.id}
      expect(response).to render_template(:index)
    end
  end
end