Rails.application.routes.draw do
  devise_for :users
  
  root 'card_items#new'

  get 'admin' => 'admin/cards#index'

  resources :cards, only: [:new, :create] do
    collection do
      get 'done'
    end
  end
  

  resources :card_items
  resource :subscribes

  namespace :admin do
    resources :users, :subscribes
    
    resources :cards, only: [:index, :show]

    resources :backgrounds do
      collection do
        post 'positions'
      end
    end
  end
end
