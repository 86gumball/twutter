Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  root to: 'pages#home'
  devise_for :users

  resources :users do
    member do
      get 'myfeed'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
