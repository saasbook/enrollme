require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe "session has information for a user that does not exist" do
    it "should not show the page for a deleted account" do
      User.create!({ :name => "John", :major => "English", :sid => "111", :email => "111@berkeley.edu"})
      session[:user_id] = 1
      post :start_team
      response.should redirect_to(team_path(1))

      User.find_by_id(1).destroy!
      post :start_team
      response.should redirect_to(logout_path)
    end
  end


end
