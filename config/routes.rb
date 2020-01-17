Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    
    get 'new_phone', to: 'users/registrations#new_phone'
    post 'create_user', to: 'users/registrations#create_user'
    post 'create_phone', to: 'users/registrations#create_phone'
    post 'save_user', to: 'users/registrations#save_user'
  end
  root "items#index"
  resources :items, only: [:index, :show,] do
    collection do
      get 'new' 
    end
  end
  resources :mypages, only: [:index, :edit,] do
    collection do
      get 'logout'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
