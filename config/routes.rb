Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#hello'
  resources :tweets do
    resources :favorites, only:[:create, :destroy]
    resources :comments, only: :create

  end
  resources :users, only: :show
end
