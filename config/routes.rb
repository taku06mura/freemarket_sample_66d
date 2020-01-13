Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    post 'create_user', to: 'users/registrations#create_user'
    get 'new_phone', to: 'users/registrations#new_phone'
    post 'create_phone', to: 'users/registrations#create_phone'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"
  resources :items, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
