Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
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
  resources :users, only: [:index, :show, :edit, :update]
  root to: "stores#index"
  namespace :admins do
    get 'toppages/index'
    root "toppages#index"
    resources :stores, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
end
