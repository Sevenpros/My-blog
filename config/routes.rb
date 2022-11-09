Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users/sign_in' => 'devise/sessions#new'
    root "devise/sessions#new"

  end
  # Defines the root path route ("/")
  #  root "devise/sessions#new"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new show create] do
      resources :comments, only: %i[new create] 
      # resources :likes, only: %i[like]
    end
  end
  post "users/:user_id/posts/:post_id/likes", as: :like, to: "likes#like"
end
