Rails.application.routes.draw do
  devise_for :users

  root 'places#index'

  resources :places do
    resources :comments
  end

  resources :categories
end
