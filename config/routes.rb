Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :user_posts
  resources :posts do
    resources :comments, only:[:create]
    resources :user_comments,only:[:create]
  end
end
