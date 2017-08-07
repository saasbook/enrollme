require "rails_helper"

RSpec.describe EmailStudents, type: :mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = User.create(:name => "David", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")

    @team = Team.new
    @team.approved = false
    @team.submitted = true
    @team.passcode = "passcode2"
    @team.users << @user
    @team.users << User.create(:name => "Sid", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Dasol", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Jason", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Adnan", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")
    @team.users << User.create(:name => "Varun", :email => "nemosalsa@gmail.com", :sid => "12345678", :major => "EECS")

  end

  # it "reminder should send an email" do
  #   EmailStudents.submit_email(@user).deliver_later
  #   ActionMailer::Base.deliveries.count.should == 1
  # end

  # it 'reminder renders the receiver email' do
  #   EmailStudents.submit_email(@user).deliver_later
  #   ActionMailer::Base.deliveries.first.to.should == [@user.email]
  # end

  # it 'reminder should set the subject to the correct subject' do
  #   EmailStudents.submit_email(@user).deliver_later
  #   ActionMailer::Base.deliveries.first.subject.should == "Don\'t forget to submit team for CS 169"
  # end

  # it 'reminder renders the sender email' do
  #   EmailStudents.submit_email(@user).deliver_later
  #   ActionMailer::Base.deliveries.first.from.should == ['enrollmeberkeley@gmail.com']
  # end

  it "Submit Team should send an email" do
    EmailStudents.successfully_submitted_email(@team).deliver_now
    ActionMailer::Base.deliveries.count.should == 1
  end

  it 'Submit Team renders the receiver email' do
    EmailStudents.successfully_submitted_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.to.should include @user.email
  end

  it 'Submit Team should set the subject to the correct subject' do
    EmailStudents.successfully_submitted_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.subject.should == "Your team has successfully submitted team enrollment to EnrollMe"
  end

  it 'Submit Team renders the sender email' do
    EmailStudents.successfully_submitted_email(@team).deliver_now
    ActionMailer::Base.deliveries.first.from.should == ['enrollmeberkeley@gmail.com']
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end


end
