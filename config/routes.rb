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
  get 'pages/california', to: 'pages#california'
  get 'pages/colorado', to: 'pages#colorado'
  get 'pages/kentucky', to: 'pages#kentucky'
  get 'pages/maine', to: 'pages#maine'
  get 'pages/miscrock', to: 'pages#miscrock'
  get 'pages/nevada', to: 'pages#nevada'
  get 'pages/newbrunswick', to: 'pages#newbrunswick'
  get 'pages/newfoundland', to: 'pages#newfoundland'
  get 'pages/newhampshire', to: 'pages#newhampshire'
  get 'pages/newyork', to: 'pages#newyork'
  get 'pages/oregon', to: 'pages#oregon'
  get 'pages/quebec', to: 'pages#quebec'
  get 'pages/roadtrips', to: 'pages#roadtrips'
  get 'pages/wyoming', to: 'pages#wyoming'
  get 'pages/utah', to: 'pages#utah'
  get 'pages/ice', to: 'pages#ice' 
  get 'pages/grandmanan', to: 'pages#grandmanan'
  get 'pages/hatchery', to: 'pages#hatchery'
  get 'pages/icefestival', to: 'pages#icefestival'
  get 'pages/icevideos', to: 'pages#icevideos'
  get 'pages/kingston', to: 'pages#kingston' 
  get 'pages/ministers', to: 'pages#ministers'
  get 'pages/mtmisery', to: 'pages#mtmisery'  
  get 'pages/nhice', to: 'pages#nhice'
  get 'pages/parleebrook', to: 'pages#parleebrook'  
  get 'pages/quarry', to: 'pages#quarry'
  get 'pages/waltonglen', to: 'pages#waltonglen'
  get 'pages/welsfordice', to: 'pages#welsfordice'
  get 'pages/mountains', to: 'pages#mountains'
  get 'pages/offroading', to: 'pages#offroading'
  get 'pages/family', to: 'pages#family'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get '/tibba' => redirect("http://deotibba.ddns.net/")
   
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
end
