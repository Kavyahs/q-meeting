require "rails_helper"

RSpec.describe "routes for My Bookings" do
  it "routes /bookings to the my bookings controller" do
    expect(get("/user/bookings")).to route_to("user/bookings#index")
  end

  it "routes /bookings to the my bookings controller" do
    expect(get("/user/bookings/1")).to route_to("user/bookings#show", id: "1")
  end

  it "new" do
    expect(get("/user/bookings/new")).to route_to("user/bookings#new")
  end

  it "create" do
    expect(post("/user/bookings")).to route_to("user/bookings#create")
  end

  it "edit" do
    expect(get("/user/bookings/1/edit")).to route_to("user/bookings#edit", id: "1")
  end

  it "update" do
    expect(put("/user/bookings/1")).to route_to("user/bookings#update", id: "1")
  end

  it "destroy" do
    expect(delete("/user/bookings/1")).to route_to("user/bookings#destroy", id: "1")
  end
end
