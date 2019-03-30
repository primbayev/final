Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root 'places#index'

  resources :places do
    resources :comments
  end
end
