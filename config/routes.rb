Rails.application.routes.draw do
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  devise_for :users
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  get "books/:id/edit" => "books#edit"
  patch "books/:id/" => "books#update"
  post "books/:id/" => "books#create" 
   delete "books/:id/" => "books#destroy"
end 
