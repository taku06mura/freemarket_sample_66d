Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }

  devise_scope :user do
    
    get 'new_phone', to: 'users/registrations#new_phone'
    post 'create_user', to: 'users/registrations#create_user'
    post 'create_phone', to: 'users/registrations#create_phone'
    post 'create_address', to: 'users/registrations#create_address'
    get 'new_card', to: 'users/registrations#new_card'
    post 'save_user', to: 'users/registrations#save_user'
  end
  root "items#index"
  resources :items, only: [:index, :show, :edit, :update, :destroy] do
    collection do 
      get 'new'
      post 'create'
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      post 'pay'
    end
  end
  resources :mypages, only: [:show, :edit,] do
    member do
      get 'on_sale'
      get 'logout'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'done'
    end
  end
  resources :cards, only: [:show] do
    collection do
      get 'new'
      post 'create'
    end
    member do
      # post 'delete', to: 'card#delete'
      post 'confirmation'
    end
  end 
  resources :addresses, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
