require 'rails_helper'

RSpec.describe "Pizzas", type: :request do
  let!(:topping) { Topping.create(name: "Mushroom", emoji: "🍄") }
  let!(:pizza) { Pizza.create(name: "Mushroom Pizza", topping_ids: [topping.id]) }

  describe "GET /pizzas" do
    it "returns http success" do
      get pizzas_path
      expect(response).to have_http_status(:success)
    end

    it "shows existing pizzas and their toppings" do
      get pizzas_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Mushroom Pizza")
      expect(response.body).to include(topping.emoji)
      expect(response.body).to include(topping.name)
    end
  end

  # describe "POST /pizzas" do

  # end

  # describe "DESTROY /pizzas" do

  # end

end
