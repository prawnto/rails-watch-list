Rails.application.routes.draw do
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
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
