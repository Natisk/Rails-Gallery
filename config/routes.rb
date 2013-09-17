Tits::Application.routes.draw do

  root to: 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
             controllers: {omniauth_callbacks: 'users/omniauth_callbacks',  registrations: 'registrations'}
  ActiveAdmin.routes(self)

  resources :images do
    resources :comments
  end

  mount Resque::Server, at: '/resque'

  get 'categories' => 'categories#index'
  get 'categories/:title' => 'categories#show', as: :special_category
  get 'comments' => 'comments#index', as: :comments

  post 'like-up' =>  'likes#create'
  post 'like-down' => 'likes#destroy'
  post 'subscribe' => 'categories#subscribe'
  post 'unsubscribe' => 'categories#unsubscribe'

end
