Rails.application.routes.draw do
  resources :users, param: :name, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
