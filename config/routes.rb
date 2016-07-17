Rails.application.routes.draw do
  resources :images
  resources :users, except: [:new]  
  resources :articles
  resources :categories, except: [:destroy]
    
  root 'home#index'
    
  get 'pages/rock', to: 'pages#rock' 
  get 'pages/ice', to: 'pages#ice' 
  get 'pages/mountains', to: 'pages#mountains'
  get 'pages/offroading', to: 'pages#offroading'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
end
