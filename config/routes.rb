Rails.application.routes.draw do
  root 'users#index'
  
  resources :users, param: :name, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :update, :destroy]
      resources :likes, only: [:create, :destroy]
    end

    # Define the post route within the user's resources block
    get 'posts/:id', to: 'posts#show', on: :member, as: 'post'
  end
end
