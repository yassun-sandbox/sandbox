Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/create'

  get 'users/show'

  get 'users/new'

  root "users#new"

  resources :users, only: %i(new create show)
  resources :sessions, only: %i(new create destroy)
end
