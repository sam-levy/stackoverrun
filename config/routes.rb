Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :questions do
    resources :answers, only: [:create]
  end
end
