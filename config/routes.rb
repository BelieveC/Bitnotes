Rails.application.routes.draw do
  
  constraints(:host => /www.bitnotes.in/) do
    match "/(*path)" => redirect {|params, req| "http://bitnotes.in/#{params[:path]}"},  via: [:get, :post]
  end
  constraints(:host => /bitnotes.tk/) do
    match "/(*path)" => redirect {|params, req| "http://bitnotes.in/#{params[:path]}"},  via: [:get, :post]
  end
/ Root path /
 root "abouts#index"

  get '/privacy'=>'abouts#privacy',as:"privacy"
  get '/about'=>'abouts#about', as: "about"
  get '/terms'=>'abouts#terms', as:"terms"
  get '/creators'=>'abouts#creators', as:"creators"
  get '/copyright'=>'abouts#copyright', as:"copyright"
  get '/try'=>'abouts#try', as:"try"
  get '/lang'=>'abouts#language',as:"language"
  get '/team'=>'abouts#team',as:"team"
  get '/result'=>'abouts#result',as:"result"
  get '/spams/add'=>'spams#add',as:'add_spam'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :sessions, only: [:create, :destroy]

/ Resources /

  resources :users
  resources :relationships, only:[:create,:destroy]

  resources :abouts
  
  resources :practicals do
    member do
      put "like"=>"practicals#upvote"
      put "dislike"=>"practicals#downvote"
    end
  end
  resources :assignments do
    member do
      put "like"=>"assignments#upvote"
      put "dislike"=>"assignments#downvote"
    end
  end
  resources :examnotes do
    member do
      put "like"=>"examnotes#upvote"
      put "dislike"=>"examnotes#downvote"
    end
  end
  resources :qpapers do
    member do
      put "like"=>"qpapers#upvote"
      put "dislike"=>"qpapers#downvote"
    end
  end
  resources :subjects do
    member do
      put "like"=>"subjects#upvote"
      put "dislike"=>"subjects#downvote"
    end
  end
  resources :colleges do
    member do
      put "like"=>"colleges#upvote"
      put "dislike"=>"colleges#downvote"
    end
  end
  resources :requests do
    member do
      put "like"=>"requests#upvote"
    end
  end

end
