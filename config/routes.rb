Rails.application.routes.draw do

  devise_for :users

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  get 'users/:user_id', to: 'users#show', as: :user

  root 'categories#index'
end
