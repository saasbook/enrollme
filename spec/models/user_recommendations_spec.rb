require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe Request, type: :model do
  describe "a vectors can be extracted from a user" do
    context '2 users' do
      before :each do
        @user1 = FactoryGirl.build(:user)
        @user1.schedule = FactoryGirl.build(:schedule)
        @user1.skill_set = FactoryGirl.build(:skill_set)
        @user2 = FactoryGirl.build(:user)
        @user2.schedule = FactoryGirl.build(:schedule)
        @user2.skill_set = FactoryGirl.build(:skill_set)
      end

      it "returns a its feature vectors" do
        expect(@user1.featureVector(:schedule)).to eq(Vector[1, 1, 1, 1, 1, 1, 1])
        expect(@user1.featureVector(:skill_set)).to eq(Vector[1, 0, 0, 0, 0])
        expect {@user1.featureVector(:nonexistent_feature)}.to raise_error
      end

      it "returns dot products with other users" do
        expect(@user1.generate_score(@user2)).to eq(6)
      end
    end
  end
end