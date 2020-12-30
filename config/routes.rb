Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "events#index"
  
  resources :events do
    resources :reviews, only: [:new, :create]
  end
  
  get '/skills/searchskill',  to: 'skills#search_skill'
  resources :skills do
    collection do
      get 'search'
    end
  end
  
  get '/reviews/searchreview',  to: 'reviews#search_review'
  resources :reviews, only: [:index] do
    collection do
      get 'search'
    end
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]

end
