Tits::Application.routes.draw do

  root to: 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
             controllers: {omniauth_callbacks: 'users/omniauth_callbacks',  registrations: 'registrations'}
  ActiveAdmin.routes(self)

  mount Resque::Server, at: '/resque'

  resources :images do
    resources :comments
    get 'page/:page', action: :index, on: :collection
  end

  resources :comments, only: [:index] do
    get 'page/:page', action: :index, on: :collection
  end

  #scope '/:locale' do
  resources :categories, only: [:index, :show]
  #end

  post 'like-up' =>  'likes#create'
  post 'like-down' => 'likes#destroy'
  post 'subscribe' => 'categories#subscribe'
  post 'unsubscribe' => 'categories#unsubscribe'
  post 'more-comments' => 'images#more_comments'

end
