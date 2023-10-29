Rails.application.routes.draw do
  devise_for :users

  # get 'users/edit'
  # get 'users/show'
  # get 'books/index'
  # get 'books/edit'
  # get 'books/new'
  # get 'books/show'
  resources :books, only: [:new, :index, :show, :create] 
  resources :users, only: [:edit, :show, :index, :create]
 
  # get 'homes/top'
  root to: "homes#top"

  get 'homes/about' => "homes#about" ,as:  'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
