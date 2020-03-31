Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  namespace :admin do
    resources :videos
    resources :events
    resources :admins, only: [:index]
  end
  get 'about', to: 'pages#about'
  get 'programs', to: 'pages#programs'
  get 'news', to: 'pages#news'
  resources :events, only: [:index, :show]
  resources :videos, only: [:index]
  resources :email, only: [:index, :new, :create]
end
