Rails.application.routes.draw do
  devise_for :users, controllers: {
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
  resources :items, only: [:index, :show, ] do
    collection do 
      get 'new'
      post 'create'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :mypages, only: [:show, :edit,] do
    member do
      get 'on_sale'
    end
    collection do
      get 'logout'
    end
  end
  resources :purchase, only:[:index] do
  end
  resources :cards, only:[:index, :new] do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
