Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new show create] do
      resources :comments, only: %i[new create] 
      # resources :likes, only: %i[like]
    end
  end
  post "users/:user_id/posts/:post_id/likes", as: :like, to: "likes#like"
end
