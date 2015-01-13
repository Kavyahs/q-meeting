require 'rails_helper'

RSpec.describe User::BookingsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  let(:booking) {FactoryGirl.create(:booking)}

  describe "GET index" do
    it "returns http success" do
      get :index, {}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: booking.id}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, {}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create, {}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:create)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update, {}, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:update)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy, {}, {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
