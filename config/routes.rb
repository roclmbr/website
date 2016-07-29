Rails.application.routes.draw do

  resources :images
  resources :users, except: [:new]  
  resources :articles
  resources :categories, except: [:destroy]
  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :evaluations, only: [:index, :new, :create, :destroy, :edit]
  resources :receipts, only: [:index, :new, :create, :destroy, :edit]
  resources :guidebooks, only: [:index, :new, :create, :destroy, :edit]
  resources :cliffs, except: [:destroy]
  resources :routes  
    
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
