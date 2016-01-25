Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'static_pages/home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'all_users' => 'users#index'
  get 'sessions/new'
  get 'sessions/new'

  resources :microposts, only: [:create, :show]

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:create, :new, :edit, :update]


end
