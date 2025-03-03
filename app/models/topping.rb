class Topping < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :emoji, length: { maximum: 2 }, allow_blank: true
end
