require 'rails_helper'

RSpec.describe "Pizzas", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/pizzas/index"
      expect(response).to have_http_status(:success)
    end
  end

end
