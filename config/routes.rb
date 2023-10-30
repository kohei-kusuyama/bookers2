Rails.application.routes.draw do
  devise_for :users

  # get 'users/edit'
  # get 'users/show'
  resources :users, only: [:edit, :show, :index, :update]

  # get 'books/index'
  # get 'books/edit'
  # get 'books/new'
  # get 'books/show'
  resources :books, only:  [:create, :index, :show, :edit, :update, :destroy]

  # get 'homes/top'
  root to: "homes#top"

  get "home/about" => "homes#about" ,as:  "home/about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
