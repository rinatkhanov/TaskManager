Rails.application.routes.draw do
  resources :comments
  resources :projects
  devise_for :users
  resources :tasks
  root to: "tasks#index"


  namespace :api, defaults: { format: :json } do
    resources :projects, only: [:index, :show, :create, :destroy]
	resources :tasks, only: [:show, :create, :destroy]
	resources :comments, only: [:create, :destroy]
  end
  
end
