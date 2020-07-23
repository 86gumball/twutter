Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :users do
    member do
      get 'myfeed'
    end
  end

  resources :friendships
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
