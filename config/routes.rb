Rails.application.routes.draw do
  root to:'home#index'

  resources :genres, only: [:index, :show, :new, :create, :edit, :update]

  resources :directors, only: [:index, :show, :new, :create, :edit, :update]

  resources :movies, only: [:index, :show, :new, :create, :edit, :update] do
    patch(:release, on: :member)
    patch(:publish, on: :member)
  end
end
