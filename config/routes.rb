Rails.application.routes.draw do
  root 'users#index'
  resources :users, param: :name, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :comments, only: [:index, :show, :create, :update, :destroy]
resources :likes, only: [:create, :destroy]
  end
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'post', on: :member
end
