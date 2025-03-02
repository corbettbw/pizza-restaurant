Rails.application.routes.draw do
  get "pages/home"

  # get "up" => "rails/health#show", as: :rails_health_check
  root "pages#home"

  get "pizzas", to: "pizzas#index", as: :pizzas
  get "toppings", to: "toppings#index", as: :toppings
end
