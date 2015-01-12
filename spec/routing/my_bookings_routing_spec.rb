require "rails_helper"

RSpec.describe "routes for My Bookings" do
  it "routes /my_bookings to the my bookings controller" do
    expect(get("/user/my_bookings")).to route_to("user/my_bookings#index")
  end
end
