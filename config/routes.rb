Rails.application.routes.draw do
  devise_for :users
  
  root 'card_items#new'

  get 'admin' => 'admin/cards#index'

  resources :cards, only: [:new, :create] do
    collection do
      get 'done'
    end
  end
  

  resources :card_items, only: [:new, :create, :update, :destroy]
  resources :sessions, only: [:new, :create]
  resource :subscribes

  namespace :admin do
    resources :users, :subscribes, :sessions
    
    resources :cards, only: [:index, :show]

    resources :backgrounds, :private_images do
      collection do
        post 'positions'
      end
    end
  end
end
