Rails.application.routes.draw do
  get "about" => "homes#about" ,as: "about"
  get "top" => "homes#top" ,as: "top"
  devise_for  :users
  root to: 'homes#top'
  resources :users, :only => [:show, :edit, :update, :create, :new]
resources :users, only: [:new, :create, :index, :show, :destroy]



end 
