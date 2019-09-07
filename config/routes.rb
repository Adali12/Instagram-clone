Rails.application.routes.draw do
  resources :profiles
  resources :posts
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy, :index]  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
