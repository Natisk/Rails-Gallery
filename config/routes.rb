Tits::Application.routes.draw do

  mount Resque::Server, at: '/resque'

  root to: 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
             controllers: {omniauth_callbacks: 'users/omniauth_callbacks',  registrations: 'registrations'}
  ActiveAdmin.routes(self)

  resources :images do
    resources :comments
    get 'page/:page', action: :index, on: :collection
  end

  resources :comments, only: [:index] do
    get 'page/:page', action: :index, on: :collection
  end

  resources :categories, only: [:index, :show]

  post 'like-up' =>  'likes#create'
  post 'like-down' => 'likes#destroy'
  post 'subscribe' => 'categories#subscribe'
  post 'unsubscribe' => 'categories#unsubscribe'
  post 'more-comments' => 'images#more_comments'


end
