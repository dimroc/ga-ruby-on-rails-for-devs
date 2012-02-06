RailsMvc::Application.routes.draw do
  resources :things
  resources :users
  match '/signup',  :to => 'users#new'
end
