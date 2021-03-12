Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
 get "top" => "homes#top"
  get "about" => "homes#about"
  resources :users
  resources :books
  get "books/:id/edit" => "books#edit"
  patch "books/:id/" => "books#update"
  post "boooks/:id/" => "books#create" 
   delete "books/:id/" => "books#destroy"
 post "users/:id" => "books#new"
 
  end
