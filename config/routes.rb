Rails.application.routes.draw do

  devise_for :users

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  get   'users/:user_id', to: 'users#show', as: :user
  patch 'users/:user_id', to: 'users#update', as: :user_update

  root 'categories#index'
end
