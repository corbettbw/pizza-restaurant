Rails.application.routes.draw do
  # get "toppings/index"
  # get "pizzas/index"
  # get "pages/home"

  # get "up" => "rails/health#show", as: :rails_health_check
  root "pages#home"

  get "pizzas", to: "pizzas#index", as: :pizzas
  resources :toppings, except: [:show]
end
