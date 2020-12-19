Rails.application.routes.draw do

  devise_for :users
  resources :events do
    resources :reviews, only: [:new, :create]
  end
  root "events#index"
  resources :skills
  resources :reviews, only: [:index, :show, :edit, :update, :destroy]
  
end
