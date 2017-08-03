require 'rails_helper'

RSpec.describe Request, type: :model do
  describe "a vectors can be extracted from a user" do
    context "with these two users" do
      user1 = FactoryGirl.build(:user)
      user1.monday = 1
      user1.tuesday = 1
      user1.wednesday = 0
      user2 = FactoryGirl.build(:user)
      user2.monday = 1
      user2.tuesday = 1
      user2.wednesday = 1
      user2.ruby_on_rails = 1
      user2.other_backend = 1
    it "returns a time vector that is 0's and 1's"
      expect (user1.timeVector == Vector[1, 1, 0, 0, 0, 0, 0])
    it "returns a skill vector that is 0's and 1's"
      expect (user1.skillVector.class == Vector[1, 1, 0, 0, 0, 0, 0])
    it "returns a hash of all vectors"
      expect(user1.featureVectors.include? "time")
      expect(user1.featureVectors.include? "skills")
    end
  end
end
