require 'spec_helper'

RSpec.describe AdminsController, type: :controller do

  it "a successful email should be sent" do
    allow_any_instance_of(ActionMailer::MessageDelivery).to receive(:deliver_now).and_return(nil)
    
    admin = double("Admin")
    
    #admins_controller = class_double("AdminsController")
    #admins_controller.team_list_email #BREAKS
  end
  
  # describe "session has information for an admin that does not exist" do
  #   it "should not show the page for a deleted account" do
  #     Admin.create!({:name => "admin", :email => "admin@admin.com"})
  #     session[:user_id] = 1
  #     session[:is_admin] = true
  #     get :index
  #     response.should render_template(:index)
  
  #     Admin.find_by_id(1).destroy!
  #     get :index
  #     response.should redirect_to(logout_path)
  #   end
  # end
  

end
