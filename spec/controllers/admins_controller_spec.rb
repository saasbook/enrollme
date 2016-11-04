require 'spec_helper'

RSpec.describe AdminsController, type: :controller do

  it "a successful email should be sent" do
    allow_any_instance_of(ActionMailer::MessageDelivery).to receive(:deliver_now).and_return(nil)
    
    admin = double("Admin")
    
    #admins_controller = class_double("AdminsController")
    #admins_controller.team_list_email #BREAKS
    
    
  end
  

end
