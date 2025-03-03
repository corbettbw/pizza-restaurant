require 'rails_helper'

RSpec.describe "Toppings", type: :request do

  let!(:topping) { Topping.create(name: "Pepperoni", emoji: "🍕") }


  describe "GET /toppings" do
    it "returns a successful response" do
      get toppings_path
      expect(response).to have_http_status(:success)
    end

    it "displays a list of toppings" do
      get toppings_path
      expect(response.body).to include("Pepperoni")
    end
  end

  describe "POST /toppings" do
    it "creates a new topping" do
      expect {
        post toppings_path, params: {topping: { name: "Mushroom", emoji: "🍄" } }
      }.to change(Topping, :count).by(1)

      expect(response).to redirect_to(toppings_path)
    end

    it "does not create duplicate toppings" do
      post toppings_path, params: { topping: { name: "Pepperoni", emoji: "🍕" } }

      expect(response.body).to include("Name has already been taken")
    end
  end

  describe "PATCH /toppings/:id" do
    it "updates an existing topping" do
      patch topping_path(topping), params: { topping: { name: "Spicy Pepperoni" } }
      expect(response).to redirect_to(toppings_path)
      expect(topping.reload.name).to eq("Spicy Pepperoni")
    end
  end

  describe "DELETE /toppings/:id" do
    it "deletes a topping" do
      expect {
        delete topping_path(topping)
      }.to change(Topping, :count).by(-1)
    end

    it "returns 404 if topping does not exist" do
      expect {
        delete topping_path(id: 99999) # Non-existent ID
      }.not_to change(Topping, :count)
  
      expect(response).to have_http_status(:not_found)
    end
  end
end
