BddDemo::Application.routes.draw do
  resources :posts

  devise_for :users

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy", as: "destroy_user_session"
  end

  root :to => 'home#index'
end
