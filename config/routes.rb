Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }
  root to: "stores#index"
  namespace :admins do
    get 'toppages/index'
    root "toppages#index"
    resources :stores, only: [:new, :create]
  end
end
