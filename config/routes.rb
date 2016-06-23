Rails.application.routes.draw do

/ Root path /  
 root "abouts#index"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :sessions, only: [:create, :destroy]

/ Resources /
  resources :abouts do
  	member do
  		get 'us'
  	end
  end
  resources :practicals
  resources :assignments
  resources :examnotes
  resources :qpapers
  resources :subjects	
  resources :colleges
  resources :requests

end
