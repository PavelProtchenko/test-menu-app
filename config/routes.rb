Rails.application.routes.draw do
  root 'menus#index'
  resources :menus

  namespace :api do
    resources :menus, only: [:index]
  end

  namespace :admin do
    resources :menus, only: [:index]
  end
end
