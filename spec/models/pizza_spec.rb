require 'rails_helper'

RSpec.describe Pizza, type: :model do
  let!(:topping) { Topping.create(name: "Mushroom", emoji: "🍄") }
  subject { described_class.new(name: "Mushroom Pizza") }

  describe "Validations" do
    it "is valid with a name" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      pizza = Pizza.new(name: nil, toppings: [topping])
      expect(pizza).to_not be_valid
      expect(pizza.errors.full_messages).to include("Name can't be blank")
    end

    it "is invalid with a duplicate name (case insensitive)" do
      pizza = Pizza.create(name: "Mushroom Pizza")
      duplicate_pizza = Pizza.create(name: "Mushroom Pizza")
      expect(duplicate_pizza).to_not be_valid
      expect(duplicate_pizza.errors.full_messages).to include("Name has already been taken")
    end
  end

  describe "Associations" do
    it "can have many toppings" do
      pizza = Pizza.create(name: "Supreme", toppings: [topping])
      another_topping = Topping.create(name: "Onion", emoji: "🧅")

      pizza.toppings << another_topping
      expect(pizza.toppings.count).to eq(2)
    end
  end
end
