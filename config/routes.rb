Zefa::Application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations", passwords: "users/passwords"}

  get 'usuario/:user_id/balancos/', to: 'balances#new', as: :new_balance
  post 'usuario/:user_id/balancos/', to: 'balances#create', as: :balances

  root to: 'users#index'
end
