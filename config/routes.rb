Tits::Application.routes.draw do

  root to: 'categories#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  resources :categories, only: [:index, :show]
  resources :categories, path: 'catalog', only: [:index] do
    resources :images, only: [:show]
  end

end
