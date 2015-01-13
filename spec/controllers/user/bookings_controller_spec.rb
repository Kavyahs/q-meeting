require 'rails_helper'

RSpec.describe User::BookingsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:booking1) {FactoryGirl.create(:booking)}
  let(:booking2) {FactoryGirl.create(:booking)}
  let(:venue) {FactoryGirl.create(:venue)}

  describe "GET index" do
    it "should display a list of bookings" do
      arr = [booking1,booking2]
      get :index, {}, {id: user.id}
      expect(assigns[:bookings]).to match_array(arr)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "should show a particular booking" do
      arr = [booking1,booking2]
      get :show, {id: booking1.id}, {id: user.id}
      expect(assigns(:booking)).to eq(booking1)
      expect(assigns[:bookings]).to match_array(arr)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "should show new form for adding a booking" do
      get :new, {}, {id: user.id}
      expect(assigns(:booking).persisted?).to eq(false)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "should add a booking" do
      booking_params = {
        booking: {
          title: "Sprint Planning Meeting",
          description: "Sprint Planning Meeting Description",
          date: Date.today,
          from: Time.now + 1.day,
          to: Time.now + 1.day + 1.hours,
          venue_id: venue.id
        }
      }
      post :create, booking_params, {id: user.id}
      expect(assigns[:booking].persisted?).to eq(true)
      expect(Booking.count).to  eq 1
    end
  end

  describe "GET edit" do
    it "should show new form for editing a particiular booking" do
      get :edit, {id: booking1.id}, {id: user.id}
      expect(assigns[:booking]).to eq(booking1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    it "should update a booking" do
      booking_params = {
        id: booking1.id,
        booking: {
          title: "Sprint Planning Meeting",
          description: "Sprint Planning Meeting Description",
          date: Date.today,
          from: Time.now + 1.day,
          to: Time.now + 1.day + 1.hours,
          venue_id: venue.id
        }
      }
      put :update, booking_params, {id: user.id}
      b = assigns[:booking]
      expect(b.title).to eq("Sprint Planning Meeting")
      expect(b.description).to eq("Sprint Planning Meeting Description")
      expect(b.date).to eq(Date.today)
      expect(b.venue_id).to eq(venue.id)
    end
  end

  describe "GET destroy" do
    it "delete a booking" do
      [booking1, booking2]
      expect do
        delete :destroy, {:id => booking2.id}, {id: user.id}
      end.to change(Booking, :count).by(-1)
    end
  end

end
