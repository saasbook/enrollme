require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #without" do
    it "returns http success" do
      get :without
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #start_team" do
    it "returns http success" do
      get :start_team
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #join_team" do
    it "returns http success" do
      get :join_team
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
