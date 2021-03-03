Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  resources :users, :only => [:show]
resources :post_images, only: [:new, :create, :index, :show, :destroy]

resources :users, only: [:show, :edit]
end 
