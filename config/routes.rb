Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/new'
root'pages#index'
devise_for :users, controllers: {
   sessions: 'users/sessions'
  }

  resources :topics
  end
