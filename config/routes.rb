Rails.application.routes.draw do
  root to:'home#index'

  resources :genres, only: [:show, :new, :create, :edit, :update]
end
