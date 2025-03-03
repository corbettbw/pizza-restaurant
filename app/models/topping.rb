class Topping < ApplicationRecord
    has_and_belongs_to_many :pizzas

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :emoji, length: { maximum: 2 }, allow_blank: true
end
