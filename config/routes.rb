Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "opinions#index"
  get 'about' => 'about#about'
  resources :opinions, only: [:create, :show, :index]
end
