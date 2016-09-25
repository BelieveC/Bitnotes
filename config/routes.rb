Rails.application.routes.draw do
  
  # constraints(:host => /bitnotes.in/) do
  #   match "/(*path)" => redirect {|params, req| "http://www.bitnotes.in/#{params[:path]}"},  via: [:get, :post]
  # end
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
  get 'practicals/:id/destroyimage'=>"practicals#destroyimage",as:"destroypimage"
  get 'assignments/:id/destroyimage'=>"assignments#destroyimage",as:"destroyaimage"
  get 'colleges/:id/destroyimage'=>"colleges#destroyimage",as:"destroycimage"
  get 'qpapers/:id/destroyimage'=>"qpapers#destroyimage",as:"destroyqimage"
  get 'examnotes/:id/destroyimage'=>"examnotes#destroyimage",as:"destroyeimage"
  get 'subjects/:id/destroyimage'=>"subjects#destroyimage",as:"destroysimage"
  get 'users/:id/dashboard'=>"users#dashboard",as:"user_dashboard"
  get 'users/:id/dashboard/assignments'=>"users#dashassignments",as:"user_dashboard_assignments"
  get 'users/:id/dashboard/examnotes'=>"users#dashexamnotes",as:"user_dashboard_examnotes"
  get 'users/:id/dashboard/qpapers'=>"users#dashqpapers",as:"user_dashboard_qpapers"
  get 'users/:id/dashboard/subjects'=>"users#dashsubjects",as:"user_dashboard_subjects"
  get 'users/:id/dashboard/colleges'=>"users#dashcolleges",as:"user_dashboard_colleges"

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


  namespace :v1 do
    resources :practicals,only: [:show,:index]
    resources :assignments,only: [:show,:index]
    resources :colleges,only: [:show,:index]
    resources :examnotes,only: [:show,:index]
    resources :qpapers,only: [:show,:index]
    resources :subjects,only: [:show,:index]
    resources :users,only: [:show]
    resources :abouts,only: [:index]
    get '/result'=>'abouts#result',as:"result"
  end

end
