require "rails_helper"

RSpec.describe EmailStudents, type: :mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = User.create(:name => "David", :email => "nemosalsa@gmail.com", :password => "password", :sid => "12345678", :major => "EECS")
    EmailStudents.submit_email(@user).deliver_later
  end
  
  it "should send an email" do
    ActionMailer::Base.deliveries.count.should == 1
  end
  
  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to.should == [@user.email]
  end
    
  it 'should set the subject to the correct subject' do
    ActionMailer::Base.deliveries.first.subject.should == "Don\'t forget to submit team for CS 169"
  end
  
  it 'renders the sender email' do
    ActionMailer::Base.deliveries.first.from.should == ['support@enrollme.com']
  end
    
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
  
end
