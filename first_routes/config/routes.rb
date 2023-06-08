Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:create, :destroy, :index, :show, :update]
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

  # Defines the root path route ("/")
  # root "articles#index"
end
