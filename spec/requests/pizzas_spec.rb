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

  describe "POST /pizzas" do
    it "creates a new pizza" do
      expect {
        post pizzas_path, params: { pizza: { name: "Pepperoni Pizza", topping_ids: [topping.id] } }
      }.to change(Pizza, :count).by(1)

      expect(response).to redirect_to(pizzas_path)
      follow_redirect!
      expect(response.body).to include("Pepperoni Pizza")
    end
  end

  describe "GET /pizzas/:id/edit" do
    it "renders the edit form" do
      get edit_pizza_path(pizza)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /pizzas/:id" do
    it "updates an existing pizza" do
      patch pizza_path(pizza), params: { pizza: { name: "Updated Pizza" } }
      expect(response).to redirect_to(pizzas_path)
      expect(pizza.reload.name).to eq("Updated Pizza")
    end
  end

  describe "DELETE /pizzas/:id" do
    it "deletes the pizza" do
      expect {
        delete pizza_path(pizza)
      }.to change(Pizza, :count).by(-1)

      expect(response).to redirect_to(pizzas_path)
    end
  end

end
