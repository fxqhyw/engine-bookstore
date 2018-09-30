Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks', sessions: 'sessions',
                                    registrations: 'registrations' }
  root 'home#index'
  get '/catalog', to: 'books#index'
  resources :books, only: %i[index show]
  resources :reviews, only: :create

  mount ShoppingCart::Engine, at: '/'

  scope '/settings' do
    as :user do
      get '/privacy', to: 'devise/registrations#edit'
    end
  end
end
