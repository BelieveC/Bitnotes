Rails.application.routes.draw do

/ Root path /  
 root "abouts#index"


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
