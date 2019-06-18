Rails.application.routes.draw do
  # get 'topics/index'
  # get 'topics/new'
  root'pages#index'

  resources :topics



# デバイスの設定
  devise_for :users, controllers: {
   sessions: 'users/sessions'
  }

end
