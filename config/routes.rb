Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "users#homepage"
  get 'about' => 'about#about'
end
