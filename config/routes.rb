Rails.application.routes.draw do
  get 'users/show/(id: current_user.id)', to: 'useus#show'
  root'pages#index'
  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'

  resources :topics
  resources :relationships, only: [:create, :destroy]
  resources :groups
  resources :group_users, only: [:create, :destroy,]
  resources :group_topics


  # デバイスの設定
  devise_for :users, controllers: {
   sessions: 'users/sessions'
  }
  devise_scope :user do

    get 'users/show/:id/following', to: 'users/registrations#following', as: 'following'
    get 'users/show/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end
  # 下に書かないと不具合を起こす
  resources :users, only: [:show, :index]

  # ネスト
  resources :topics do
    resources :comments, only: [:create, :destroy]
  end
  resources :groups do
    resources :group_users, only: [:create, :destroy,]
    resources :group_topics
  end
end
