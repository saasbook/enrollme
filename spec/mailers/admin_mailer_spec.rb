require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
    
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @admin = Admin.create(:name => "Michael David Sasson", :email => "mds@gmail.com")

    @team = Team.new
    @team.approved = false
    @team.submitted = true
    @team.passcode = "passcode1"
    @user = User.create(:name => "David", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << @user
    @team.users << User.create(:name => "Sid", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Dasol", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Jason", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Adnan", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Varun", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    
  end
  
  it "Invite New Admin should send an email" do
    AdminMailer.invite_new_admin(@admin).deliver_now
    ActionMailer::Base.deliveries.count.should == 1
  end
  
  it 'Invite New Admin renders the receiver email' do
    AdminMailer.invite_new_admin(@admin).deliver_now
    ActionMailer::Base.deliveries.first.to.should == [@admin.email]
  end

  it 'Invite New Admin should set the subject to the correct subject' do
    AdminMailer.invite_new_admin(@admin).deliver_now
    ActionMailer::Base.deliveries.first.subject.should == "Superadmin gave you access as admin for EnrollMe"
  end
  
  it 'Invite New Admin renders the sender email' do
    AdminMailer.invite_new_admin(@admin).deliver_now
    ActionMailer::Base.deliveries.first.from.should == ['enrollmeberkeley@gmail.com']
  end
  
    
  it "Approved Team should send an email" do
    AdminMailer.send_approved_email(@team).deliver_now
    ActionMailer::Base.deliveries.count.should == 1
  end
  
  it 'Approved Team renders the receiver email' do
    AdminMailer.send_approved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.to.should == [@user.email]
  end

  it 'Approved Team should set the subject to the correct subject' do
    AdminMailer.send_approved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.subject.should == "Your team has been approved"
  end
  
  it 'Approved Team renders the sender email' do
    AdminMailer.send_approved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.from.should == ['enrollmeberkeley@gmail.com']
  end
  
  
  it "Disapproved Team should send an email" do
    AdminMailer.send_disapproved_email(@team).deliver_now
    ActionMailer::Base.deliveries.count.should == 1
  end
  
  it 'Disapproved Team renders the receiver email' do
    AdminMailer.send_disapproved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.to.should == [@user.email]
  end

  it 'Disapproved Team should set the subject to the correct subject' do
    AdminMailer.send_disapproved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.subject.should == "Your team has been disapproved"
  end
  
  it 'Disapproved Team renders the sender email' do
    AdminMailer.send_disapproved_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.from.should == ['enrollmeberkeley@gmail.com']
  end
  
  # it 'team_list_email' do
  #   AdminMailer.params[:search] = 'Test Search'
  #   AdminMailer.team_list_email(@admin).deliver_now
  #   ActionMailer::Base.deliveries.first.to.should == [@admin.email]
  # end
  
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
  
end
