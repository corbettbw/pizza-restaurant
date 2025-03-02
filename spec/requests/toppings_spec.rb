require 'rails_helper'

RSpec.describe "Toppings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/toppings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
