Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :users do
    member do
      get 'myfeed'
      get 'myfriends'
    end
  end

  resources :friendships

  get 'pages/all_users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
