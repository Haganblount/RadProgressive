Rails.application.routes.draw do
  devise_for :users
  
  root 'cards#new'

  get 'admin' => 'admin/users#index'

  resource :cards

  namespace :admin do
    resources :users

    resources :backgrounds do
      collection do
        post 'positions'
      end
    end
  end
end
