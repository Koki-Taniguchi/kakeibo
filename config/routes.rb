Rails.application.routes.draw do
  devise_for :users
  root "root#top"
  resources :recodes, only: [:create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
