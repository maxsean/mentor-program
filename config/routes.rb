Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:sessions => "users/sessions"}

  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :destroy]
      resources :images, only: [:update]
      resources :mentees, only: [:index, :show]
      resources :grades, only: [:create, :show, :update, :destroy]
      resources :stats, only: [:create, :show, :update, :destroy]
    end
  end

  root 'static_pages#index'

  get '*path', to: 'static_pages#index'
end
