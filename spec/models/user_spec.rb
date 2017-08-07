require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Checking emails always lowercase" do
    it "Keeps lowercase emails the same" do
        @u = User.create!(name: "A", email: "abcd@berkeley.edu", major: "Whatever", sid: "26726699", waitlisted: true)
        expect(@u.email == "abcd@berkeley.edu")
    end

    it "Turns all caps to lowercase" do
        @v = User.create!(name: "B", email: "ABCDE@BERKELEY.EDU", major: "Whatever", sid: "26726698", waitlisted: true)
        expect(@v.email == "abcde@berkeley.edu")
    end

    it "Turns some uppercase to all lowercase" do
        @w = User.create!(name: "C", email: "Abcdef@berkeley.edu", major: "Whatever", sid: "26726697", waitlisted: true)
        expect(@w.email == "abcdef@berkeley.edu")
    end

  end
end
