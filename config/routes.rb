Rails.application.routes.draw do
  root 'users#index'

  resources :users, param: :name, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :update, :destroy]

      # Add routes for liking and unliking a post
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'

      # Define the post route within the posts resources block
      get 'posts/:id', to: 'posts#show', on: :member, as: 'post'
      resources :likes, only: [:create, :destroy]
    end
  end
end



