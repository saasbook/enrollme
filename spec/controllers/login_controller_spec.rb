require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe "GET #hello" do
    it "returns http success" do
      get :hello
      expect(response).to have_http_status(:success)
    end
  end

end
