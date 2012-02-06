RailsMvc::Application.routes.draw do
  get "sessions/new"

  resources :things
  resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  root :to => "home#index"
  
end
