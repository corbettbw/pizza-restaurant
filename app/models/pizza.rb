class Pizza < ApplicationRecord
    has_and_belongs_to_many :toppings

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
