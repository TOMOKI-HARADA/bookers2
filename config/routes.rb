Rails.application.routes.draw do
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  devise_for :users
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  get "books/:id/edit" => "books#edit"
  get "books/:id/update" => "books#update"
  post "books/:id/" => "books#create" 
end 
