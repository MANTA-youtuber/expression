Rails.application.routes.draw do
  get 'users/show/(id: current_user.id)', to: 'useus#show'
  get 'topics/index'
  get 'topics/new'
  root'pages#index'

 resources :topics

  resources :topics do
    resources :comments
  end

  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'
  # デバイスの設定
  devise_for :users, controllers: {
   sessions: 'users/sessions'
  }

  resources :users, only: [:show, :index]


end
