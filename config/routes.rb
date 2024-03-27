Rails.application.routes.draw do
  root to:'home#index'

  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
end
