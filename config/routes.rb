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
  		get 'test'
  	end
  end
  resources :practicals do
    member do
      put "like"=>"practicals#upvote"
    end
  end
  resources :assignments do
    member do
      put "like"=>"assignments#upvote"
    end
  end
  resources :examnotes do
    member do
      put "like"=>"examnotes#upvote"
    end
  end
  resources :qpapers do
    member do
      put "like"=>"qpapers#upvote"
    end
  end
  resources :subjects do
    member do
      put "like"=>"subjects#upvote"
    end
  end
  resources :colleges do
    member do
      put "like"=>"colleges#upvote"
    end
  end
  resources :requests do
    member do
      put "like"=>"requests#upvote"
    end
  end

end
