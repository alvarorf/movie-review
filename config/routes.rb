Rails.application.routes.draw do
  get '/login'  , to: 'sessions#new'
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to:  'opinions#index'
  get '/signup', to: 'users#new'
  get '/follow_user/:id', to: 'users#follow_user', as: :follow_user
  resources :users
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :opinions, only: [:create, :show, :index]
end
