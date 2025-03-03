require 'rails_helper'

RSpec.describe Topping, type: :model do
  subject { described_class.new(name: "Pepperoni", emoji: "🍕") }

  describe "validations" do

    it "is valid with a name" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid if name is not unique (case insensitive)" do
      Topping.create!(name: "Pepperoni", emoji: "🍕")
      duplicate_topping = Topping.new(name: "pepperoni")
      expect(duplicate_topping).to_not be_valid
    end

    it "allows empty emoji" do
      subject.emoji = ""
      expect(subject).to be_valid
    end

    it "limits emoji to 2 characters max" do
      subject.emoji = "🍕🍕🍕"
      expect(subject).to_not be_valid
    end
  end
end
