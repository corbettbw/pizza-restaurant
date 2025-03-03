Rails.application.routes.draw do
  root "pages#home"

  resources :pizzas
  resources :toppings, except: [:show]
end
