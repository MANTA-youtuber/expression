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
  devise_scope :user do

    get 'users/show/:id/following', to: 'users/registrations#following', as: 'following'
    get 'users/show/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end


  resources :users, only: [:show, :index]
  resources :relationships, only: [:create, :destroy]

end
