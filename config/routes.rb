Rails.application.routes.draw do
  resources :users, except: [:new]  
  resources :articles
    
  root 'home#index'
    
  get 'pages/rock', to: 'pages#rock' 
  get 'pages/ice', to: 'pages#ice' 
  get 'pages/offroading', to: 'pages#offroading'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
end
