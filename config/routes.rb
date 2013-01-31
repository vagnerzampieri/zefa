Zefa::Application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations", passwords: "users/passwords"}

  get 'balanco/:user_id', to: 'balances#new', as: :new_balance
  post 'balanco/', to: 'balances#create', as: :balances

  root to: 'users#index'
end
