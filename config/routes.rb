Rails.application.routes.draw do
  # get 'reviews/create'
  # get 'reviews/destroy'
  # get 'lists/index'
  # get 'lists/new'
  # get 'lists/show'
  # get 'lists/create'
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: :create
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
