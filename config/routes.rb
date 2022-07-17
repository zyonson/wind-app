Rails.application.routes.draw do
  get 'stores/index'
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
    resources :stores, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :stores do
    collection do
      get 'search'
    end
  end
  resources :stores, only: [:index, :show]
end
